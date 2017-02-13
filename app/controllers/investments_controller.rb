class InvestmentsController < ApplicationController
  before_action :set_deal
  skip_after_action :verify_authorized
  def show
    @investment = Investment.find(params[:id])
  end
  # def new
    # @investment = Investment.new
    ## @investment = @deal.investments.build
  # end
  def create
    @investment = Investment.new(investment_params)
    @investment.deal = @deal
    # @investment.user = @user
    if @investment.save
      redirect_to deal_path(@deal)
    else
      render "deals/show"
    end
  end

  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy
    redirect_to deal_path(@deal)
  end

  private
  def set_deal
    @deal = Deal.find(params[:deal_id])
  end
  def investment_params
    params.require(:investment).permit(:description, :price, :shares)
  end
end

