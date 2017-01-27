class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  def index
    @deals = Deal.all
  end
  def show
    @tenant = Tenant.new
    # @tenant = @deal.tenants.build
  end
  def new
    @deal = Deal.new
  end
  def create
    @deal = Deal.new(deal_params)
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
      redirect_to deal_path(@deal), notice: 'Deal was successfully updated'
    else
      render :edit
    end
  end
  def destroy
    @deal.destroy
    redirect_to deals_path, notice: 'Deal was successfully deleted'
  end

  private
  def deal_params
    params.require(:deal).permit(:description, :kind, :address, :image_url, :occupancy, :yield)
  end
  def set_deal
    @deal = Deal.find(params[:id])
  end
end

# *Strong params*: You need to *whitelist* what can be updated by the user
# Never trust user data!
