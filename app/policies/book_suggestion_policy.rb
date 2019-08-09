class BookSuggestionPolicy < ApplicationPolicy
  def permitted_attributes_for_create
    %i[synopsis price author title link editor year user_id]
  end
end
