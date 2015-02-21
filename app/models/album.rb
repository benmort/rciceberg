###ALBUM POLYMORPHIC###
class Album < ActiveRecord::Base
    
  #polymorphic associations
  belongs_to :albumable, :polymorphic => true
  
  attr_accessor :image
  
  has_many :images, :as => :imageable
  
  accepts_nested_attributes_for :images
  
  def entity
    albumable_type.constantize.find(albumable_id)
  end
  
  def self.entity_path(entity)
    underscored = entity.class.name.gsub!(/(.)([A-Z])/,'\1_\2')
    underscored = entity.class.name if underscored == nil
    path = underscored.downcase+"_path"
  end

end
