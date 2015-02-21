class Product < ActiveRecord::Base

	include ActionView::Helpers::NumberHelper
	include ActionView::Helpers::TextHelper
	include ActionView::Helpers::UrlHelper
	include ActionView::Helpers::DateHelper
	include ERB::Util
	include Rails.application.routes.url_helpers

	### PHOTO ALBUM ###
	has_many :albums, :as => :albumable
	has_many :album_images, :source => "images", :through => :albums

	has_one :product_image, :class_name => 'ProductImage', dependent: :destroy
	belongs_to :tenant
    attr_accessible :name, :description, :price, :stock, :product_image, :product_image_attributes, :source, :tenant_id
	accepts_nested_attributes_for :product_image, :allow_destroy => true

	def human_price
		return "$"+price.to_s
	end
end