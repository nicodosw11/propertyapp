class RegistrationsController < Devise::RegistrationsController

  def update
    update_params = account_update_params
    # required for settings form to submit when password is left blank
    if update_params[:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| update_params.delete(p) }
    end
    if update_params[:password].present? and update_params[:current_password].blank?
      [:current_password].collect{|p| update_params.delete(p) }
    end

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

   # def update_resource(resource, params)
   #   resource.update_without_password(params)
   # end

  def update_resource(resource, params)
    resource.update_attributes(params)
  end
  def after_update_path_for(resource)
    deals_path
  end
end
