Tenant.create!(:name => 'Remote Control Iceberg', :subdomain => 'dev', :domain => 'rciceberg.com')
TenantProfile.create!(:tenant_id => "1", :title => 'Remote Control Iceberg', :subtitle => 'Subtitle', :description => 'Lorem ipsum')
Product.create!(:tenant_id => "1", :name => 'Product', :description => "this is a great product", :price => '123.21', :stock => "45")

PaymentOption.create!(:name => "Paypal", :fee_type => "flat", :fee => "1.00", :description => "Paypal Express")
PaymentOption.create!(:name => "Amazon", :fee_type => "flat", :fee => "1.20", :description => "Amazon Flex Pay")

# Admin.create!(:email => "benjaminmort@gmail.com", :password => "appleseed", :password_confirmation => "appleseed")
# Admin.create!(:email => "email.scottwarren@gmail.com", :password => "appleseed", :password_confirmation => "appleseed")

Plan.create!(:name => "Extras Pack", :price => 25.95, :description => "2 extras (Tea and Chocolate)")
Plan.create!(:name => "Her Favourites Pack", :price => 20.95, :description => "1 extra (Tea or Chocolate)")
Plan.create!(:name => "Every Month Pack", :price => 15.95, :description => "0 extras")
