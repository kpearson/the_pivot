class HomeController < ApplicationController
  def index
    if params[:fromsignup]
      flash[:notice] = "Welcome #{current_user.first_name}"
    end
  end

  def not_found
  end
end
