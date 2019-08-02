class RentUserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email,
             :image_url, :rents_counter

  def image_url
    { url: object.image } unless object.image.nil?
  end

  def rents_counter
    object.rents.count
  end
end
