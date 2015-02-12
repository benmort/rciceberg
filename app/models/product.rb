class Product < ActiveRecord::Base
	has_many :images, as: :imageable
    attr_accessible :name, :description, :price, :stock, :images
	accepts_nested_attributes_for :images, :reject_if => lambda { |t| t[:image].nil?}, :allow_destroy => true
end