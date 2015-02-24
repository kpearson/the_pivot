class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: false
  end

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
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
    @user = User.find(params[:id])

  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to :back
  end

  # def destroy
    # when deleting a user, it's listing should be deleted too
  # end

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
