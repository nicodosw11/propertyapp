class DealsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]
  ############### for test only neutralizing devise/pundit #######
  skip_before_action :authenticate_user!
  skip_after_action :verify_policy_scoped, :only => :index
  skip_after_action :verify_authorized, except: :index
  ################################################################
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  def index
    @deals = Deal.all
  end
  def show
  end
  def new
    @deal = Deal.new
    # pundit ######
    # authorize @deal
    ###############
  end
  def create
    @deal = Deal.new(deal_params)
    # pundit ######
    # authorize @deal
    ###############
    if @deal.save
      redirect_to deals_path, notice: 'Deal was successfully created'
    else
      flash.now[:alert] = "Deal has not been created."
      render "new"
    end
  end
  def edit
  end
  def update
    if @deal.update(deal_params)
      redirect_to @deal, notice: 'Deal was successfully updated'
    else
      flash.now[:alert] = "Deal has not been updated."
      render :edit
    end
  end
  def destroy
    @deal.destroy
    redirect_to deals_path, notice: 'Deal was successfully deleted'
  end

  private
  def deal_params
    params.require(:deal).permit(:street, :city, :district, :postcode, :property_type, :occupancy, :amenities_description, :location_transport_description, :surface, :nb_rooms, :nb_bedrooms, :nb_bathrooms, :active, :funding_goal, :start_date, :end_date)
  end
  def set_deal
    @deal = Deal.find(params[:id])
    # pundit ######
    # authorize @deal
    ###############
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The deal you were looking for could not be found."
    redirect_to deals_path
  end
end

# *Strong params*: You need to *whitelist* what can be updated by the user
# Never trust user data!



