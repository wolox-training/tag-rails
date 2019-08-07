class BookSuggestionPolicy < ApplicationPolicy
  def permitted_attributes_for_create
    %i[synopsis price author title link editor year user_id]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
