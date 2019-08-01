# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre
  attribute :editor, key: :publisher
  attribute :year
  attribute :image, key: :image_url
  has_one :actual_rent

  class RentSerializer < ActiveModel::Serializer
    attributes :id
    attribute :rent_start, key: :from
    attribute :rent_end, key: :to
    attributes :book_id, :user_id
    attribute :returned_at
  end
end
