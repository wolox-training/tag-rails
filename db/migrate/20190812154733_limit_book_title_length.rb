class LimitBookTitleLength < ActiveRecord::Migration[5.1]
  def up
    Book.find_each do |book|
      book.title = book.title.truncate 25
      book.save!
    end

    change_column :books, :title, :string, limit: 25
  end

  def down
    change_column :books, :title, :string, limit: nil
  end
end
