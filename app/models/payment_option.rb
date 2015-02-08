class PaymentOption < ActiveRecord::Base
  attr_accessible :amount, :amount_display, :description, :shipping_desc, :delivery_desc, :limit
  has_many :orders
end
