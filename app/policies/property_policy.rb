class PropertyPolicy < ApplicationPolicy
  class Scope < Scope
    # def resolve
      # scope.all # anyone can see the full list of properties
      # scope.where(user: user) # only the creator can see the full list of properties
      # scope.none if user.nil?
      # scope.all if user.admin?
    # end
    def resolve
      # if user.admin?
      #   scope.all
      # else
      #   scope.none
      # end
      # scope.all if user.admin?
      # user.admin? ? scope.all : scope.none
    end
  end
  # user is the current_user
  # record is the argument passed to 'authorize' in Controller => @property

  def all?
    user_is_admin?
  end

  # def index?
  #   user_is_admin?
  # end

  def show?
    user_is_admin? # anyone can see a property
  end

  # def new
  #   false # none can create a property
  # end

  def create?
    # true # anyone can create a property
    user_is_admin?
  end
  # def new?
  #   return true
  # end

  def update?
    # record.user == user # only the creator can update a property
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
    # record.user == user # only the creator can delete a property
    # user_is_owner?
    # user_is_owner_or_admin?
    user_is_admin?
  end

  private
  def user_is_owner?
    record.user == user
  end
  def user_is_admin?
    # user.admin
    user.try(:admin?)
  end
  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

end
