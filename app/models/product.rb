class Product < ActiveRecord::Base
	has_one :product_image, :class_name => 'ProductImage', dependent: :destroy
	belongs_to :tenant
    attr_accessible :name, :description, :price, :stock, :product_image, :product_image_attributes, :source, :tenant_id
	accepts_nested_attributes_for :product_image, :allow_destroy => true

	def human_price
		return "$"+price.to_s
	end
end