class AddProductIdToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :product_id, :integer
    add_column :product_categories, :category_id, :integer
  end
end
