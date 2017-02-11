class InvestmentsController < ApplicationController
  before_action :set_deal

  def new
    @investment = Investment.new
    ## @investment = @deal.investments.build
  end
  def create
    @investment = Investment.new(investment_params)
    @investment.deal = @deal
    if @investment.save
      redirect_to deal_path(@deal)
    else
      render "deals/show"
    end
  end

  private
  def set_deal
    @deal = Deal.find(params[:deal_id])
  end
  def investment_params
    params.require(:investment).permit(:content)
  end
end

