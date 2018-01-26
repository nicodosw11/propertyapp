class Admin::InvestmentsController < Admin::ApplicationController
  before_action :set_investment, except: [:index]

  def index
    @investments = Investment.all.order(:id)
    # @investment = Investment.new
    # @deal = @investment.deal
  end

  def update
    if @investment.update(investment_params)
      respond_to do |format|
        format.html {
          flash[:notice] = "Investment has been updated"
          redirect_to [admin, @investment]
        }
        format.js
      end
    else
      respond_to do |format|
        format.html {
          flash.now[:alert] = "Investment has not been updated"
          render "edit"
        }
        format.js
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @investment.destroy
    respond_to do |format|
      format.html {
        flash[:notice] = "Investment has been deleted"
        # redirect_to @deal
        # redirect_to deal_path(@deal)
        redirect_to admin_investments_path
      }
      format.js
    end
  end

  def validate
    sleep 2
    @investment.update(status: 'approved')
    InvestmentMailer.validated(@investment).deliver_later
  end

  private

  def set_investment
    @investment = Investment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The transaction you were looking for could not be found."
    redirect_to admin_investments_path
  end
  def investment_params
    params.require(:investment).permit(:status, :shares, :pledge_amount)
  end
end
