class RemoveProductCategoryIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :product_category_id, :integer
  end
end
