class TenantsController < ApplicationController
  # skip_after_action :verify_authorized, only: [:all]
  before_action :set_deal, except: [:index, :all]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  def all
    @tenants = Tenant.all
    authorize @tenants
  end

  def index
    @deal = Deal.find(params[:deal_id])

    #solution1
    # @tenants = policy_scope(Deal)

    #try
    @tenants = policy_scope(@deal.tenants)
    authorize @tenants, :index?

    # @tenants = @deal.tenants
    # # authorize :index
  end

  ########################################
  # def index
  #   @tenants = @deal.tenants
  # end
  # def all
  #   # @tenants = Tenant.all
  #   @tenants = policy_scope(Tenant)
  # end
  ########################################

  def show
    # @deal = Deal.find(params[:deal_id])
    @tenant = Tenant.find(params[:id])
    # @tenant = @deal.tenants.find(params[:tenant_id])
    # @tenant = @deal.tenants
  end
  def new
    @tenant = @deal.tenants.build
    authorize @tenant
  end
  def create
    @tenant = @deal.tenants.build(tenant_params)
    authorize @tenant
    if @tenant.save
      flash[:notice] = "Tenant has been created."
      redirect_to [@deal, @tenant]
    else
      flash.now[:alert] = "Tenant has not been created."
      render "new"
    end
  end
  def edit
    @tenant = Tenant.find(params[:id])
  end
  def update
    @tenant = Tenant.find(params[:id])
    if @tenant.update(tenant_params)
      flash[:notice] = "Tenant has been updated."
      redirect_to [@deal, @tenant]
    else
      flash.now[:alert] = "Tenant has not been updated."
      render "edit"
    end
  end
  def destroy
    @tenant.destroy
    flash[:notice] = "Tenant has been deleted."
    redirect_to @deal
  end
  private
  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :age)
  end
  def set_tenant
    @tenant = @deal.tenants.find(params[:id])
    authorize @tenant
  end
  # def set_tenant
  #   @tenant = tenant.find(params[:id])
  # end
  def set_deal
    @deal = Deal.find(params[:deal_id])
    authorize @deal
  end
end
