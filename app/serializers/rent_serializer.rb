# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :id
  attribute :rent_start, key: :from
  attribute :rent_end, key: :to
  attributes :book_id, :user_id
  attribute :returned_at
end
