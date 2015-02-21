class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, :polymorphic => true
      t.attachment :source
      t.timestamps
    end
  end
end
