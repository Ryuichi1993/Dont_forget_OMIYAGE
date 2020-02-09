class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.integer :end_user_id
      t.integer :product_id
      t.text :comment

      t.timestamps
    end
  end
end
