class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  #adding attributes to user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country_of_residence])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country_of_residence])
  end

  include Pundit
  # after_action :verify_authorized, except: [:index],
  #   unless: :devise_controller?
  # after_action :verify_policy_scoped, only: [:index],
  #   unless: :devise_controller?
  ## for ui => redirecting not allowed actions
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  ## for ui => redirecting for not allowed actions
  def not_authorized
    redirect_to root_path, alert: "You aren't allowed to do that."
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
