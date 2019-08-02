# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre
  attribute :editor, key: :publisher
  attribute :year
  attribute :image, key: :image_url
  has_one :actual_rent
end
