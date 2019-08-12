# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :book_suggestions, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, :locale, presence: true
end
