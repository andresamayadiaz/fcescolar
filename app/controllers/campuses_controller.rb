class CampusesController < ApplicationController
  load_and_authorize_resource
  before_action :set_campus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user.active_role=='super_administrator' and session[:active_franchise].present?
      @campuses = Campus.where(:franchise_id=>session[:active_franchise].to_i)
    else
      @campuses = Campus.where(:franchise_id=>current_user.person.franchise_id)
    end
    respond_with(@campuses)
  end

  def show
    respond_with(@campus)
  end

  def new
    @campus = Campus.new
    respond_with(@campus)
  end

  def edit
  end

  def create
    @campus = Campus.new(campus_params)
    flash[:notice] = 'Campus was successfully created.' if @campus.save
    respond_with(@campus) do |format|
      format.html { redirect_to campuses_url }
    end
  end

  def update
    flash[:notice] = 'Campus was successfully updated.' if @campus.update(campus_params)
    respond_with(@campus) do |format|
      format.html { redirect_to campuses_url }
    end
  end

  def destroy
    @campus.destroy
    respond_with(@campus)
  end

  def get_by_franchise_id
    @campuses = Campus.where(:franchise_id=>params[:franchise_id])
    render :json => @campuses
  end

  private
  def set_campus
    @campus = Campus.find(params[:id])
  end

  def campus_params
    params.require(:campus).permit(:name, :address, :number_of_classrooms, :franchise_id)
  end
end
