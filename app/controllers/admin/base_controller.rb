class Admin::BaseController < ApplicationController
  before_action :require_admin

  def dashboard
  end

  private

  def require_admin
    redirect_to not_found_path unless current_user && current_user.admin?
  end
end
