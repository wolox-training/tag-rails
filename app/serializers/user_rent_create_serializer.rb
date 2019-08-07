class UserRentCreateSerializer < UserRentsSerializer
  has_one :book

  class BookSerializer < RentBookSerializer
    attribute :description
  end
end
