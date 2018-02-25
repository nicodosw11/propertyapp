class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

  #adding attributes to user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country_of_residence])
    update_attrs = [:password, :password_confirmation, :current_password]
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [update_attrs, :first_name, :last_name, :country_of_residence, :avatar_url])
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

  def set_i18n_locale_from_params
    # I18n.locale = params[:locale] || I18n.default_locale
    # for authenticate_user! redirection
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def default_url_options(options={})
    { :locale => ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
    # for authenticate_user! redirection
    # (I18n.locale.to_sym.eql?(I18n.default_locale.to_sym) ? {} : {locale: I18n.locale}).merge options
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
