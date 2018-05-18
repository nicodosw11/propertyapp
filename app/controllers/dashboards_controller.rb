class DashboardsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, :verify_policy_scoped
  helper_method :sort_column, :sort_direction

  def index
    @investments = current_user.investments
    @transactions = current_user.investments.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  private

  def sort_column
    Investment.column_names.include?(params[:sort]) ? params[:sort] : "deal_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
