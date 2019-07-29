class AddIsDeletedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_deleted, :integer, null: false, default: 0
  end
end
