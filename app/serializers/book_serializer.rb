# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :editor, :year,
             :created_at, :image_url, :actual_rent, :updated_at

  def actual_rent
    now = Date.current
    object.rents.detect { |rent| (rent.rent_start <= now) && (now <= rent.rent_end) }
  end

  def image_url; end
end
