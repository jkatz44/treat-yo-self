class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_business
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_business
    @current_business ||= Business.find(session[:business_id]) if session[:business_id]
    rescue ActiveRecord::RecordNotFound
  end
  
  def require_business
    redirect_to '/business_login' unless current_business
  end
end
