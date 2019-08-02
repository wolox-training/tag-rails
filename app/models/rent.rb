# frozen_string_literal: true

class Rent < ApplicationRecord
  alias_attribute :from, :rent_start
  alias_attribute :to, :rent_end
  belongs_to :user
  belongs_to :book

  validates :user, :book, :rent_start, :rent_end,
            presence: true
end
