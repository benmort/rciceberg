class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :ipn

  def index
    # render :text => current_product.to_yaml
    @posts = Post.all
  end

  def checkout
    # @payment_options = PaymentOption.ordered
  end

  def subscribe
    if Rails.env.development?
      Stripe.api_key = Settings.stripe.tst.secret_key
    else
      Stripe.api_key = Settings.stripe.prd.secret_key
    end

    charge = Stripe::Charge.create(
      #### Amount is in cents ####
      :amount => 1595,
      # :amount => Product.find(params[:product_id]).price,
      :currency => Settings.currency.downcase,
      # get Credit Card token from the request
      :card => params[:stripeToken]
    )

    puts charge.to_yaml

    # If successful redirect to confirmation
    # redirect_to :action confirmation with a success
    # else
    # redirect_to :action checkout
    # redirect back to the checkout page as a failure
  end

  def credit_card
    # get cc token from the request
    unless params[:token].blank?
      # create the order
      @order = Order.prefill!(:name => current_product.name, :price => current_product.price, :user_id => @user.id, :payment_option => payment_option)
      # post to stripe
      # if successful redirect to the "confirmation" page
    end
    # if we got here, something went wrong
    # redirect to an error page
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
    elsif payment_option_name == 'amazon'
      redirect_to AmazonFlexPay.multi_use_pipeline(
        @order.uuid,
        callback_url,
        :transaction_amount => price,
        :global_amount_limit => price + Settings.charge_limit,
        :collect_shipping_address => "True",
        :payment_reason => current_product.name
      )
    end

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
