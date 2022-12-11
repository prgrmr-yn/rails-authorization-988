class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(user: user)
      user.admin? ? scope.all : scope.where.not(user: user)
    end
  end
  def show?
    return true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    return record.user == user
  end

  def destroy?
    return record.user == user
  end
end
