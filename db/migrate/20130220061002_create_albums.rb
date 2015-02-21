class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :albumable, :polymorphic => true
      t.timestamps
    end
  end
end
