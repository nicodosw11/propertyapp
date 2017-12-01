class Admin::DealsController < Admin::ApplicationController
  def new
  @deal = Deal.new
  end
  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      # redirect_to deals_path, notice: 'Deal was successfully created'
      flash[:notice] = "Deal was successfully created"
      redirect_to @deal
    else
      flash.now[:alert] = "Deal has not been created"
      render "new"
    end
  end
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to deals_path, notice: 'Deal was successfully deleted'
  end
  private
  def deal_params
    params.require(:deal).permit(:street, :city, :district, :postcode, :property_type, :occupancy, :amenities_description, :location_transport_description, :surface, :nb_rooms, :nb_bedrooms, :nb_bathrooms, :active, :funding_goal, :start_date, :end_date)
  end
end
