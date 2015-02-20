class CreateProductImage < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
    	t.attachment :source
    	t.references :product
    end
  end
end
