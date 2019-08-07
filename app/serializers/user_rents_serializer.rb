class UserRentsSerializer < ActiveModel::Serializer
  attributes :id
  attribute :rent_start, key: :from
  attribute :rent_end, key: :to
  attribute :returned_at
  has_one :book, serializer: RentBookSerializer
  has_one :user, serializer: RentUserSerializer
end
