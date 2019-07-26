class AddNotNullConstraintsToUsersAndBooks < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :books, :genre, false
    change_column_null :books, :author, false
    change_column_null :books, :image, false
    change_column_null :books, :title, false
    change_column_null :books, :editor, false
    change_column_null :books, :year, false
  end
end
