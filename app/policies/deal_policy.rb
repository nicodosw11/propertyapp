class DealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # anyone can see the full list of deal
      # scope.where(user: user) # only the creator can see the full list of deals
    end
  end
  # user is the current user
  # record is the argument passed to 'authorize' in Controller => @deal

  def show?
    true # anyone can see a deal
  end

  # def new
  #   false # none can create a deal
  # end

  def create?
    # true # anyone can create a deal
    user_is_admin?
  end
  # def new?
  #   return true
  # end

  def update?
    # record.user == user # only the creator can update a deal
    # user_is_owner?
    # user_is_owner_or_admin?
    user_is_admin?
  end
  # def edit?
    # if record.user == user
    #   true
    # else
    #   false
    # end
    #same as
    # record.user == user ? true : false
    #same as
    # record.user == user
  # end

  def destroy?
    # record.user == user # only the creator can delete a deal
    # user_is_owner?
    # user_is_owner_or_admin?
    user_is_admin?
  end

  private
  def user_is_owner?
    record.user == user
  end
  def user_is_admin?
    user.admin
  end
  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

end
