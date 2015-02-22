###POLYMORPHIC###
class Image < ActiveRecord::Base
  
  	attr_accessible :source, :type

  	#polymorphic associations
  	belongs_to :imageable, :polymorphic => true
  
  	# image source
  	has_attached_file :source, :styles => {:thumb_square => "100x100#", :small_square => "200x200#", :small_landscape => "175x132#", :large_landscape => "500x375#"}, :default_url => "/images/:style/missing.png"
	validates_attachment :source, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
end
