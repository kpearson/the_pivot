class User::DashboardController < ApplicationController
  before_action :require_host

  def index
    @listings = Listing.all
  end

  private

  def require_host
    redirect_to root_path unless current_user && current_user.host? && current_user.id == params[:slug].to_i
  end
end
