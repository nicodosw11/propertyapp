class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def update_phone_number?
    user
  end
  def verify_phone_number?
    user
  end
end
