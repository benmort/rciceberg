class PaymentOption < ActiveRecord::Base
  attr_accessible :name, :fee_type, :fee, :description
  has_many :orders

  def self.ordered
  	self.all
  end
end
