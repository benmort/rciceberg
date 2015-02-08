class TenantProfile < ActiveRecord::Base
  	attr_accessible :title, :subtitle, :description
	belongs_to :tenant
end