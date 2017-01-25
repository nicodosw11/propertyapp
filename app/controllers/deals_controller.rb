class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  def index
    @deals = Deal.all
  end
  def show
  end
  def new
    @deal = Deal.new
  end
  def create
    Deal.create(deal_params)
    redirect_to deals_path
  end
  def edit
  end
  def update
    @deal.update(deal_params)
    redirect_to deal_path(@deal)
  end
  def destroy
    @deal.destroy
    redirect_to deals_path
  end

  private
  def deal_params
    params.require(:deal).permit(:description, :kind, :address, :image_url, :occupancy, :yield)
  end
  def set_deal
    @deal = Deal.find(params[:id])
  end
end
