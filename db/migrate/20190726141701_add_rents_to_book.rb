class AddRentsToBook < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :rents, foreign_key: true
  end
end
