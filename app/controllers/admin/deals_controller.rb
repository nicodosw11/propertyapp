class Admin::DealsController < Admin::ApplicationController
  before_action :set_deal, except: [:index, :new, :create]
  def index
    @deals = Deal.all
  end
  def new
  @deal = Deal.new
  @deal.tenants.build
  end
  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      # redirect_to deals_path, notice: 'Deal was successfully created'
      flash[:notice] = "Deal was successfully created"
      # redirect_to @deal
      redirect_to listing_admin_deal_path(@deal)
    else
      flash.now[:alert] = "Deal has not been created"
      render "new"
    end
  end
  def destroy
    # @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to deals_path, notice: 'Deal was successfully deleted'
  end

  def description
  end

  def listing
  end

  def location
  end

  def photo_upload
    @photos = @deal.photos
  end

  def pricing
  end

  def period
    # unless params[:start_date].blank? && params[:end_date].blank?
    #  start_date = Date.parse(params[:start_date])
    #  end_date = Date.parse(params[:end_date])
    #  @days = (end_date - start_date).to_i + 1
    # end
 end

  def tenancy
  end

  private
  def deal_params
    params.require(:deal).permit(
      :street,
      :city,
      :district,
      :postcode,
      :property_type,
      :occupancy,
      :amenities_description,
      :location_transport_description,
      :surface,
      :nb_rooms,
      :nb_bedrooms,
      :nb_bathrooms,
      :active,
      :funding_goal,
      :start_date,
      :end_date,
      :current_funding,
      :property_value,
      :duration,
      :interest_rate,
      tenants_attributes: Tenant.attribute_names.map(&:to_sym).push(:_destroy)
    )
  end

  def set_deal
    # @deal = Deal.find(params[:id])
    @deal = Deal.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The deal you were looking for could not be found."
    redirect_to deals_path
  end
end
