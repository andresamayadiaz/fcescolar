class TimeSlotsController < ApplicationController
  load_and_authorize_resource
  before_action :set_time_slot, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def filter_campus
    if params[:campus_id].present?
      @time_slots = TimeSlot.where(:campus_id=>params[:campus_id]).active
      @campus = Campus.all
      render 'index'
    else
      redirect_to time_slots_path
    end
  end

  def index
    @time_slots = TimeSlot.active
    if current_user.active_role=='super_administrator'
      @time_slots = @time_slots.select{|ts| ts.franchise_id==session[:active_franchise].to_i }
      @campus = Campus.where(:franchise_id=>session[:active_franchise].to_i)
    else
      @time_slots = @time_slots.select{|ts| ts.franchise_id==current_user.person.franchise_id }
      @campus = Campus.where(:franchise_id=>current_user.person.franchise_id)
    end
    respond_with(@time_slots)
  end

  def show
    respond_with(@time_slot)
  end

  def new
    @time_slot = TimeSlot.new
    respond_with(@time_slot)
  end

  def edit
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)
    respond_with(@time_slot) do |format|
      format.html { 
        if @time_slot.save 
          flash[:notice] = 'TimeSlot was successfully created.'
          redirect_to time_slots_url 
        else 
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@time_slot) do |format|
      format.html { 
        if @time_slot.update(time_slot_params)
          flash[:notice] = 'TimeSlot was successfully updated.'
          redirect_to time_slots_url 
        else 
          render 'edit'
        end
      }
    end
  end

  def destroy
    @time_slot.update(:status=>false)
    respond_with(@time_slot) do |format|
      format.html {
        redirect_to time_slots_url, notice: 'Deleted successfully'
      }
    end
  end

  private
    def set_time_slot
      @time_slot = TimeSlot.find(params[:id])
    end

    def time_slot_params
      params.require(:time_slot).permit(:franchise_id, :campus_id, :start_time, :end_time, :status)
    end
end
