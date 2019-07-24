# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user, :book, :rent_start, :rent_end,
            presence: true
end
