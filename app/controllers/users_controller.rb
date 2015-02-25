class UsersController < ApplicationController
  before_action :ensure_user_signed_in, only: [:edit, :udpate]

  def new
    @user = User.new
    render layout: false
  end

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
    @trips = @user.reservations.where(status: "approved").map do |reservation|
      reservation.listing
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      head(200)
    else
      render :new, layout: false, status: 422
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :display_name,
                                 :password,
                                 :about_me,
                                 :image)
  end
end
