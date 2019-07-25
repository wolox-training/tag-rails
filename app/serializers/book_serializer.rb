# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image,
             :editor, :year, :year, :created_at, :updated_at
end
