# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre, :editor, :year, :image_url

  has_one :actual_rent

  def actual_rent
    now = Date.current
    object.rents.find_by("rent_start <= '#{now}' and '#{now}' <= rent_end")
  end

  def image_url
    object.image
  end
end
