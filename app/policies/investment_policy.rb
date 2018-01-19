class InvestmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def index?
    user_is_admin?
  end
  def show?
    user.try(:admin?) || record.deal.has_member?(user)
    # user.try(:admin?) || record.deal.roles.exists?(user_id: user)
  end
  def create?
    user.try(:admin?) || record.deal.has_manager?(user) || record.deal.has_editor?(user)
  end
  def update?
    user.try(:admin?) || record.deal.has_manager?(user) || (record.deal.has_editor?(user) && record.user == user)
  end
  def destroy?
    user.try(:admin?) || record.deal.has_manager?(user)
  end
  def user_is_admin?
    user.try(:admin?)
  end
end
