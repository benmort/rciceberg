class Product < ActiveRecord::Base
  has_one :image, as: :imageable
    attr_accessible :name, :description, :price, :stock, :image, :images, :image_attributes, :images_attributes, :tenant_id
  accepts_nested_attributes_for :image, :reject_if => lambda { |t| t[:image].nil?}, :allow_destroy => true
end
