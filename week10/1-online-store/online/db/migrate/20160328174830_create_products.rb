class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :brand_id, null:false
      t.integer :category_id, null:false
      t.decimal :price, null:false
      t.integer :quantity, null:false 

      t.timestamps null:false
    end
  end
end
