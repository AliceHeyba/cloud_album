class AccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
        scope.where(user: user)
      else
        scope.none
      end
    end
  end
end
