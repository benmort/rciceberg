class Product < ActiveRecord::Base

	include ActionView::Helpers::NumberHelper
	include ActionView::Helpers::TextHelper
	include ActionView::Helpers::UrlHelper
	include ActionView::Helpers::DateHelper
	include ERB::Util
	include Rails.application.routes.url_helpers

	### PHOTO ALBUM ###
  	has_many :images, :as => :imageable
  	accepts_nested_attributes_for :images, :allow_destroy => true

	belongs_to :tenant
    attr_accessible :name, :description, :price, :stock, :images_attributes, :source, :tenant_id

	def human_price
		return "$"+price.to_s
	end
end