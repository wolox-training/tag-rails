class AddNotNullConstraintsToRents < ActiveRecord::Migration[5.1]
  def change
    change_column_null :rents, :rent_start, false
    change_column_null :rents, :rent_end, false
    change_column_null :rents, :user_id, false
    change_column_null :rents, :book_id, false
  end
end
