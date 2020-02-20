class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.integer :end_user_id
      t.integer :product_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
