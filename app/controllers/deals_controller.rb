class DealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  ############### for test only neutralizing devise/pundit #######
  # skip_before_action :authenticate_user!
  # skip_after_action :verify_policy_scoped, :only => :index
  # skip_after_action :verify_authorized, except: :index
  ################################################################
  before_action :set_deal, only: [:show, :edit, :update]

  def index
    # @deals = Deal.all
    @deals = policy_scope(Deal)
  end

  def show
    authorize @deal, :show?
  end

  def edit
    authorize @deal, :update?
  end

  def update

    new_params = deal_params
    new_params = deal_params.merge(active: true) if is_deal_ready

    authorize @deal, :update?
    if @deal.update(new_params)
      # redirect_to @deal, notice: 'Deal was successfully updated'
      redirect_back(fallback_location: request.referer)
    else
      flash.now[:alert] = "Deal has not been updated"
      render :edit
    end
  end


  private
  def set_deal
    @deal = Deal.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The deal you were looking for could not be found."
    redirect_to deals_path
  end

  def is_deal_ready
    !@deal.active && !@deal.funding_goal.blank? && !@deal.amenities_description.blank? && !@deal.location_transport_description.blank? && !@deal.photos.blank? && !@deal.street.blank?
  end

  def deal_params
    params.require(:deal).permit(:street, :city, :district, :postcode, :property_type, :occupancy, :amenities_description, :location_transport_description, :surface, :nb_rooms, :nb_bedrooms, :nb_bathrooms, :active, :funding_goal, :start_date, :end_date)
  end
end

# *Strong params*: You need to *whitelist* what can be updated by the user
# Never trust user data!



