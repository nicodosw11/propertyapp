class UsersController < ApplicationController
  skip_after_action :verify_authorized
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
end
