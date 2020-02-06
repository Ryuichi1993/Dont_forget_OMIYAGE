class ChangeDataPhoneNumberToShops < ActiveRecord::Migration[5.2]
  def change
  	change_column :shops, :phone_number, :string
  end
end
