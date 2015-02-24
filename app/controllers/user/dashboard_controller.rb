class User::DashboardController < ApplicationController
  before_action :require_host

  def index
    @host = User.find_by(slug: params[:slug])
  end

  private

  def require_host
    redirect_to root_path unless current_user && current_user.host? && current_user.slug == params[:slug]
  end
end
