class BooksSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :genre,
             :created_at, :updated_at

  def image
    { url: object.image }
  end

  def publisher
    object.editor
  end
end
