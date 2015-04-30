Paypal.sandbox! if Rails.env.development?

request = Paypal::Express::Request.new(
  :username   => Settings.paypal_username,
  :password   => Settings.paypal_password,
  :signature  => Settings.paypal_signature
)
