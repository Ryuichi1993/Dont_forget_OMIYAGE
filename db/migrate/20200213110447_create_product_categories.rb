class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.integer :producer_id
      t.integer :shop_id
      t.string  :category_name

      t.timestamps
    end
  end
end
