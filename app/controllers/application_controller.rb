class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :set_all_campus
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def set_all_campus
    if signed_in? and current_user.present?
      if current_user.active_role=='super_administrator' and session[:active_franchise].present?
        @all_campus = Campus.where(:franchise_id=>session[:active_franchise].to_i)
      else
        @all_campus = Campus.where(:franchise_id=>current_user.person.franchise_id)
      end
    end 
  end
end
