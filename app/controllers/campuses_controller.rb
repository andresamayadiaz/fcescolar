class CampusesController < ApplicationController
  before_action :set_campus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @campuses = Campus.all
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
      params.require(:campus).permit(:name, :address, :classrooms, :franchise_id)
    end
end
