class RemoveProducerIdFromProductCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_categories, :producer_id, :integer
    remove_column :product_categories, :shop_id, :integer
    remove_column :product_categories, :category_name, :string
  end
end
