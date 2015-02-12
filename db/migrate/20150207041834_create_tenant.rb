class CreateTenant < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :domain
      t.string :subdomain
      t.timestamps
    end
  end
end