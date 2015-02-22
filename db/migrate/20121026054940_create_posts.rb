class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references  :tenant
      t.string :title
      t.text :content      
      t.timestamps
    end
  end
end