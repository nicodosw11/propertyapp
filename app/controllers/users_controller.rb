class UsersController < ApplicationController
  before_action :authenticate_user!

  def update_phone_number
    authorize current_user
    current_user.update_attributes(user_params)
    current_user.generate_pin
    current_user.send_pin

    redirect_to edit_user_registration_path, notice: "Enregistré..."
  rescue Exception => e
    redirect_to edit_user_registration_path, alert: "#{e.message}"
  end

  def verify_phone_number
    authorize current_user
    current_user.verify_pin(params[:user][:pin])

    if current_user.phone_verified
      flash[:notice] = "Votre numéro de téléphone est validé."
    else
      flash[:alert] = "Nous n'avons pas pu valider votre numéro de téléphone."
    end

    redirect_to edit_user_registration_path

  rescue Exception => e
    redirect_to edit_user_registration_path, alert: "#{e.message}"
  end
  private

    def user_params
      params.require(:user).permit(:phone_number, :pin)
    end
end
