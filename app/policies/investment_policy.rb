class InvestmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
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
end
