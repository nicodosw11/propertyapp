class DealsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  def index
    # @deals = Deal.all
    # @deals = policy_scope(Deal)
    @deals = policy_scope(Deal).order(created_at: :asc)
  end
  def show
    @property = @deal.property
    @investment = Investment.new
    # @tenant = @deal.tenants.build
    # @property = @deal.properties
    # @property = @deal.properties.find(params[:property_id])
    # @property = @deal.properties.find(params[:id])
    # auction = Auction.find(params[:auction_id])
    # bid = auction.bids.find(params[:id])
  end
  def new
    @deal = Deal.new
    # pundit ######
    authorize @deal
    ###############
  end
  def create
    # @deal = Deal.new(deal_params)
    # @deal.user = current_user
    # same as
    # @deal = current_user.deals.build(deal_params)
    @deal = Deal.new(deal_params)
    # pundit ######
    authorize @deal
    ###############
    if @deal.save
      redirect_to deals_path, notice: 'Deal was successfully created'
    else
    render :new
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
    params.require(:deal).permit(:description, :kind, :address, :image_url, :occupancy, :valuation, :nb_investors, :yield)
  end
  def set_deal
    @deal = Deal.find(params[:id])
    # pundit ######
    authorize @deal
    ###############
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The deal you were looking for could not be found."
    redirect_to deals_path
  end
end

# *Strong params*: You need to *whitelist* what can be updated by the user
# Never trust user data!
