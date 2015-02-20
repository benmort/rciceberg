class ProductImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :source
end