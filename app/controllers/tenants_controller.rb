class TenantsController < ApplicationController
  before_action :set_deal
  def index
    @tenants = Tenant.all
  end
  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.deal = @deal
    if @tenant.save
      redirect_to deal_path(@deal)
    else
      # render "deals/show"
      render "deals/index"
      # render :partial => 'deals/index', :object => @post
    end
  end
  private
  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :age)
  end
  def set_deal
    @deal = Deal.find(params[:deal_id])
  end
end
