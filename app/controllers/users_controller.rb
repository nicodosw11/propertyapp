class UsersController < ApplicationController
  skip_after_action :verify_authorized
  # skip_after_action :verify_policy_scoped, :only => :index
  # skip_after_action :verify_authorized, except: :index
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
end
