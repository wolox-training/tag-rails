# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre
  attribute :editor, key: :publisher
  attribute :year
  attribute :image, key: :image_url
  has_one :actual_rent

  def actual_rent
    object.rents.find_by('rent_start <= now() and returned_at is null')
  end
end
