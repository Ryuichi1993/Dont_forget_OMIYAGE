class AddRegularHolidayToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :regular_holiday, :string
    add_column :shops, :division, :string
    add_column :shops, :phone_number, :integer
    add_column :shops, :status, :string
  end
end
