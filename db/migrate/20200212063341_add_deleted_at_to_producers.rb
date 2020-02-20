class AddDeletedAtToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :deleted_at, :datetime
    add_index :producers, :deleted_at
  end
end
