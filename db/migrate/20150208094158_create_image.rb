class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.attachment :source
    	t.references :imageable, polymorphic: true, index: true
    end
  end
end
