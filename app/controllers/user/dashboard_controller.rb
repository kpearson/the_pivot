class User::DashboardController < ApplicationController

  def index 
    @listings = Listing.all
  end
end
