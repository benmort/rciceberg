Tenant.create!(:name => 'Remote Control Iceberg', :subdomain => 'dev', :domain => 'rciceberg.com')
TenantProfile.create!(:tenant_id => "1", :title => 'Remote Control Iceberg', :subtitle => 'Subtitle', :description => 'Lorem ipsum')
Product.create!(:tenant_id => "1", :name => 'Product', :description => "this is a great product", :price => '123.21', :stock => "45")