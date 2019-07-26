# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book_id, :user_id, :returned_at

  def from
    object.rent_start
  end

  def to
    object.rent_end
  end

  def returned_at; end
end
