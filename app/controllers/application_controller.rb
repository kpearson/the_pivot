class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  rescue_from CanCan::AccessDenied do
    redirect_to not_found_path
  end

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActionView::MissingTemplate, with: :handle_record_not_found
  rescue_from ArgumentError, with: :handle_argument_error

  def set_cart
    @cart ||= Cart.new(session["cart"])
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
    @current_user
  end

  def signed_in?
    current_user.present?
  end

  def ensure_user_signed_in
    unless signed_in?
      flash[:notice] = "You must be signed in"
      redirect_to root_path
    end
  end

  def handle_record_not_found
    redirect_to root_path
  end

  def handle_argument_error
    flash[:notice] = "What dates did you have in mind?"
    redirect_to :back
  end

  helper_method :current_user
end
