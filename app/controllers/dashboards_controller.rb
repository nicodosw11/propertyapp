class DashboardsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, :verify_policy_scoped

  def index
    @investments = current_user.investments
  end

end
