# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :rents, dependent: :destroy

  validates :genre, :author, :image,
            :title, :editor, :year,
            presence: true

  def actual_rent
    rents.find_by 'rent_start <= ? and returned_at is null', Date.current
  end
end
