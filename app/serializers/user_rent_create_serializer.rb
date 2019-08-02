class UserRentCreateSerializer < ActiveModel::Serializer
  attributes :id
  attribute :rent_start, key: :from
  attribute :rent_end, key: :to
  attribute :returned_at
  has_one :book
  has_one :user

  class BookSerializer < ActiveModel::Serializer
    attributes :id, :author, :title, :genre
    attribute :editor, key: :publisher
    attributes :year, :image_url
    attribute :description

    def image_url
      { url: object.image } unless object.image.nil?
    end
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email,
               :image_url, :rents_counter, :comments_counter,
               :unread_notifications_count

    def image_url
      { url: object.image } unless object.image.nil?
    end

    def rents_counter
      object.rents.count
    end

    def comments_counter
      0
    end

    def unread_notifications_count
      0
    end
  end
end
