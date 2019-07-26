class RemoveRentsFromUsersAndBooks < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :users, :rents
    remove_foreign_key :books, :rents
    remove_column :users, :rents_id
    remove_column :books, :rents_id
  end
end
