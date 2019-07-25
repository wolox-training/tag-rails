# frozen_string_literal: true

class Book < ApplicationRecord
  validates :genre, :author, :image,
            :title, :editor, :year,
            presence: true
end
