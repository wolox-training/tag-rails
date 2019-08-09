class BookSuggestionPolicy < ApplicationPolicy
  def permitted_attributes_for_create
    %i[synopsis price author title link publisher year user_id editor]
  end
end
