class RentBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre
  attribute :editor, key: :publisher
  attributes :year, :image_url

  def image_url
    { url: object.image } unless object.image.nil?
  end
end
