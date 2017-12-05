class InvestmentsController < ApplicationController
  before_action :set_deal
  before_action :set_investment, only: [:show, :edit, :update, :destroy]
  # for test only
  # skip_before_action :authenticate_user!
  # skip_after_action :verify_authorized
  # skip_after_action :verify_policy_scoped, :only => :index
  # skip_after_action :verify_authorized, except: :index

  def new

    # we need @deal in our 'simple_form_for'
    # @deal = Deal.find(params[:deal_id])
    # @investment = Investment.new

    @investment = @deal.investments.build
    # same as
    # @investment = Investment.new
    # @investment.deal = @deal

    authorize @investment, :create?

  end

  def create
    @investment = Investment.new(investment_params)
    # we need `deal_id` to associate investment with corresponding deal
    @investment.deal = @deal
    # using build above 2 lines => @investment = @deal.investments.build(investment_params)
    @investment.user = current_user
    # using build in 1 line => @investment = @deal.investments.build(investment_params.merge(user: current_user))
    # or => @investment = current_user.investments.build(investment_params.merge(deal: @deal))
    authorize @investment, :create?
    if @investment.save
      flash[:notice] = "Investment has been created"
      redirect_to [@deal, @investment] # redirect to deal_investment_path(@deal, @investment)
    else
      flash.now[:alert] = "Investment has not been created"
      render "new"
    end
  end

  def update
    authorize @investment, :update?
    if @investment.update(investment_params)
      flash[:notice] = "Investment has been updated"
      redirect_to [@deal, @investment]
    else flash.now[:alert] = "Investment has not been updated"
      render "edit"
    end
  end

  def show
    authorize @investment, :show?
  end

  def edit
    authorize @investment, :update?
  end

  def destroy
    authorize @investment, :destroy?

    @investment.destroy
    flash[:notice] = "Investment has been deleted"
    redirect_to @deal
    # redirect_to deal_path(@deal)
  end

  def index
    @deal = Deal.find(params[:deal_id])
    @investments = @deal.investments
  end

  private
  def set_deal
    @deal = Deal.find(params[:deal_id])
  end
  def set_investment
    @investment = @deal.investments.find(params[:id])
  end
  def investment_params
    # params.require(:investment).permit(:description, :price, :shares)
    params.require(:investment).permit(:description, :price, :shares)
  end
end

