# frozen_string_literal: true

class BooksSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image
  attribute :editor, key: :publisher
  attributes :year, :genre, :created_at, :updated_at

  def image
    { url: object.image }
  end
end
