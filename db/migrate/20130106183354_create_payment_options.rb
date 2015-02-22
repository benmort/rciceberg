class CreatePaymentOptions < ActiveRecord::Migration
  def change
    create_table :payment_options do |t|
      t.string :name
      t.string :fee_type
      t.decimal :fee
      t.text :description
      t.timestamps
    end
  end
end
