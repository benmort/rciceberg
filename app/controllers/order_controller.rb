class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :ipn

  def index
    # render :text => current_product.to_yaml
    @posts = Post.all
  end

  def checkout
    @payment_options = PaymentOption.ordered
  end

  def prefill
    @user = User.find_or_create_by(:email => params[:email])
    if params[:paypal_payment_method]
      payment_option_name = 'paypal'
      payment_option = PaymentOption.find_by_name('paypal')
    elsif params[:amazon_payment_method]
      payment_option_name = 'amazon'
      payment_option = PaymentOption.find_by_name('amazon')
    end

    @order = Order.prefill!(:name => current_product.name, :price => current_product.price, :user_id => @user.id, :payment_option => payment_option)

    # This is where all the magic happens. We create a multi-use token with Amazon, letting us charge the user's Amazon account
    # Then, if they confirm the payment, Amazon POSTs us their shipping details and phone number
    # From there, we save it, and voila, we got ourselves a order!
    port = Rails.env.production? ? "" : ":3000"
    callback_url = "#{request.scheme}://#{request.host}#{port}/order/postfill"

    if payment_option_name == 'paypal'
      # also need to check if the current product subscription mode is true
      # which will need to be another entry into the product database table
      self.subscription_paypal_payment
    elsif payment_option_name == 'amazon'
      redirect_to AmazonFlexPay.multi_use_pipeline(
        @order.uuid,
        callback_url,
        :transaction_amount => current_product.price,
        :global_amount_limit => current_product.price + Settings.charge_limit,
        :collect_shipping_address => "True",
        :payment_reason => current_product.name
      )
    end

  end

  def subscription_paypal_payment
    # Paypal.sandbox! if Rails.env.development?
    # Paypal.sandbox!

    request = Paypal::Express::Request.new(
      :username   => Settings.paypal_username,
      :password   => Settings.paypal_password,
      :signature  => Settings.paypal_signature,
      :subject =>  current_product.name
    )


    payment_request = Paypal::Payment::Request.new(
      :currency_code => :AUD, # if nil, PayPal use USD as default
      :billing_type  => :RecurringPayments,
      :billing_agreement_description => current_product.name,
      :amount => Paypal::Payment::Common::Amount.new(
        :total => current_product.price
      )
    )

    # abort payment_request.to_yaml

    response = request.setup(
      payment_request,
      '/YOUR_SUCCESS_CALBACK_URL',
      '/YOUR_CANCEL_CALBACK_URL'
    )

    abort response.to_yaml
    response.redirect_uri
  end

  def postfill
    unless params[:callerReference].blank?
      @order = Order.postfill!(params)
    end
    # "A" means the user cancelled the order before clicking "Confirm" on Amazon Payments.
    if params['status'] != 'A' && @order.present?
      redirect_to :action => :share, :uuid => @order.uuid
    else
      redirect_to root_url
    end
  end

  def share
    @order = Order.find_by(:uuid => params[:uuid])
  end

  def ipn
  end
end
