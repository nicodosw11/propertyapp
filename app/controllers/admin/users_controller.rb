class Admin::UsersController < Admin::ApplicationController
  before_action :set_deals, only: [:new, :create, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]
  def index
    @users = User.excluding_archived.order(:email)
  end
  def show
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    build_roles_for(@user)

    if @user.save
      respond_to do |format|
        format.html {
          flash[:notice] = "User has been created"
          redirect_to admin_users_path
        }
        format.js  # <-- will render `app/views/admin/users/create.js.erb`
      end
    else
      respond_to do |format|
        format.html {
          flash.now[:alert] = "User has not been created"
          render "new"
        }
        format.js  # <-- idem
      end
    end
  end
  def edit
  end
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    User.transaction do
      @user.roles.clear
      build_roles_for(@user)

      if @user.update(user_params)
        respond_to do |format|
          format.html {
            flash[:notice] = "User has been updated"
            redirect_to admin_users_path
          }
          format.js  # <-- will render `app/views/admin/users/create.js.erb`
        end
      else
        respond_to do |format|
          format.html {
            flash.now[:alert] = "User has not been updated"
            render "edit"
            raise ActiveRecord::Rollback
          }
          format.js  # <-- idem
        end
      end
    end
  end
  def archive
    if @user == current_user
      flash[:alert] = "You cannot archive yourself!"
    else
      @user.archive
      flash[:notice] = "User has been archived."
    end
    redirect_to admin_users_path
  end
  def destroy
    @user_id = @user.id
    @user.destroy
    respond_to do |format|
      format.html {
        flash[:notice] = "User has been deleted"
        redirect_to admin_users_path
      }
      format.js
    end
  end
  private
  def set_deals
    @deals = Deal.order(:city)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
  end
  def build_roles_for(user)
    role_data = params.fetch(:roles, [])
    role_data.each do |deal_id, role_name|
      if role_name.present?
        user.roles.build(deal_id: deal_id, role: role_name)
      end
    end
  end
end
