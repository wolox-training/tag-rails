class BookSuggestionCreateSerializer < ActiveModel::Serializer
  attributes :id, :synopsis, :price, :author,
             :title, :link, :editor, :year,
             :user_id, :created_at, :updated_at
end
