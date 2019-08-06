class RentPolicy < ApplicationPolicy
  def create?
    user.id == record.user.id
  end

  def permitted_attributes_for_create
    %i[user_id book_id from to]
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
