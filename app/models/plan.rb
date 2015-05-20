class Plan < ActiveRecord::Base
  has_many :subscriptions
  attr_accessible :name, :price, :description, :id

  # @TODO make this ID 2, or even a flag on the database
  def is_most_popular
    return false
  end

  def human_price
    return "$" + price.to_s
  end
end
