class Image < ActiveRecord::Base
	attr_accessible :source
	belongs_to :imageable, polymorphic: true
end