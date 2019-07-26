# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :rents, dependent: :destroy

  validates :genre, :author, :image,
            :title, :editor, :year,
            presence: true
end
