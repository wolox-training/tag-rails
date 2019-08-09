class BookSuggestion < ApplicationRecord
  alias_attribute :publisher, :editor
  belongs_to :user, optional: true

  validates :author, :title, :link, :editor, :year,
            presence: true
end
