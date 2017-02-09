class TenantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # user.admin? ? scope.all : scope.none
      # scope.all if user.admin?
      # scope.all => Tenant.all
      scope.tenants if user.admin?
    end
  end

  def all?
    user_is_admin?
  end

  # def index?
  #   user_is_admin?
  # end

  def show?
    user_is_admin? # anyone can see a tenant
  end

  # def new
  #   false # none can create a tenant
  # end

  def create?
    # true # anyone can create a tenant
    user_is_admin?
  end
  # def new?
  #   return true
  # end

  def update?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  private
  def user_is_admin?
    # user.admin
    user.try(:admin?)
  end

end
