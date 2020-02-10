class AddNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :name, :string
  end
end
