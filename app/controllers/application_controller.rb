class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :set_all_campus
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def set_all_campus
    if signed_in? and current_user.present?
  	 @all_campus = Campus.all if current_user.active_role=='super_administrator' or current_user.active_role=='franchise_director'
    end 
  end
end
