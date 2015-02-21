class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :uid
      t.string :permalink
      t.string :title
      t.string :blurb
      t.text :content
      t.string :header_image
      
      t.string :state
      t.datetime :published_at
      
      t.boolean :visible
      t.boolean :recommended
      
      t.string :uid
      t.string :permalink
      
      t.timestamps
    end
  end
end