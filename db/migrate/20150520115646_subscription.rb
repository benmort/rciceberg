class Subscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :plan_id, :integer
    add_column :subscriptions, :email, :string
  end
end
