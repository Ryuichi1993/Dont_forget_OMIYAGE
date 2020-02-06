class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :producer_id
      t.integer :shop_id
      t.integer :product_category_id
      t.integer :end_user_id
      t.string :product_name
      t.text :product_text
      t.integer :product_price
      t.string :product_image_id

      t.timestamps
    end
  end
end
