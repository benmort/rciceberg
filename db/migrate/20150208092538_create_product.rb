class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.references 	:tenant
    	t.string 		:name
    	t.text 			:description
    	t.float			:price
    	t.integer		:stock
      	t.timestamps
    end
  end
end
