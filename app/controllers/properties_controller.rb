class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]
  before_action :set_deal
  def index
    @properties = Property.all
  end
  def show
  end
  private
  def property_params
    params.require(:property).permit(:genre, :surface, :nb_rooms, :nb_bedrooms, :city, :district, :full_address)
  end
  def set_property
    @property = Property.find(params[:id])
  end
  def set_deal
    @deal = Deal.find(params[:deal_id])
  end
end

