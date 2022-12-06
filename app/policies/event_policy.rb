class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all same as event.all
      scope.all
      # scope.where(user: user)
      # only show me events created by the user who's signed in
    end
  end

  def show?
    return true
  end

  def new?
    return create?
  end

  def find?
    return true
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
