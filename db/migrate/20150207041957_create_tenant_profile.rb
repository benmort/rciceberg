class CreateTenantProfile < ActiveRecord::Migration
  def change
    create_table :tenant_profiles do |t|
    	t.references 	:tenant
    	t.string 		:title
    	t.string 		:subtitle
    	t.text 			:description
      	t.timestamps
    end
  end
end
