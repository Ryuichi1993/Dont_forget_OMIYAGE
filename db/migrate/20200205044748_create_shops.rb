class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :producer_id
      t.string :shop_name
      t.text :shop_text
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.integer :open
      t.integer :close
      t.string :station
      t.integer :minutes_on_foot
      t.integer :minutes_on_car
      t.string :shop_image_id

      t.timestamps
    end
  end
end
