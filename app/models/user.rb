# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, :email,
            presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password, presence: true, if: "id.nil?"
end
