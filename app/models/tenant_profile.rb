class TenantProfile < ActiveRecord::Base
  	attr_accessible :title, :subtitle, :description, :tenant_id
	belongs_to :tenant
end