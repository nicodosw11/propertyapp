class PropertiesController < ApplicationController
  # skip_after_action :verify_authorized, only: [:all]
  before_action :set_deal, except: [:index, :all]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def all
    @properties = Property.all
    authorize @properties
  end

  def index
    @deal = Deal.find(params[:deal_id])
    # @properties = policy_scope(Deal)
    @properties = policy_scope(@deal.properties)
    # authorize :index
    # authorize @deal
  end

  ########################################
  # def index
  #   @properties = @deal.properties
  # end
  # def all
  #   # @properties = Property.all
  #   @properties = policy_scope(Property)
  # end
  ########################################

  def show
    # @property = @deal.properties.find(params[:property_id])
    # @property = @deal.properties
    # auction = Auction.find(params[:auction_id])
    # bid = auction.bids.find(params[:id])
    # @author = Author.find(params[:author_id])
    # @book = Book.find(params[:id])
    @deal = Deal.find(params[:deal_id])
    @property = Property.find(params[:id])
  end
  def new
    @property = @deal.properties.build
    authorize @property
  end
  def create
    @property = @deal.properties.build(property_params)
    authorize @property
    if @property.save
      flash[:notice] = "Property has been created."
      redirect_to [@deal, @property]
    else
      flash.now[:alert] = "Property has not been created."
      render "new"
    end
  end
  def edit
    @property = Property.find(params[:id])
  end
  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:notice] = "Property has been updated."
      redirect_to [@deal, @property]
    else
      flash.now[:alert] = "Property has not been updated."
      render "edit"
    end
  end
  def destroy
    @property.destroy
    flash[:notice] = "Property has been deleted."
    redirect_to @deal
  end
  private
  def property_params
    params.require(:property).permit(:genre, :surface, :nb_rooms, :nb_bedrooms, :city, :district, :full_address)
  end
  def set_property
    @property = @deal.properties.find(params[:id])
    authorize @property
  end
  # def set_property
  #   @property = Property.find(params[:id])
  # end
  def set_deal
    @deal = Deal.find(params[:deal_id])
    authorize @deal
  end
end
