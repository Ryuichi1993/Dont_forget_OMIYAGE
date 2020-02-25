class AddShopIdToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :shop_id, :integer
  end
end
