class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def add_period_detail
    @period = Period.find(params[:period_id])
    @new_period_detail = PeriodDetail.create_single_record(params)
    if @new_period_detail
      flash[:notice] = 'New period detail has been added'
    else
      flash[:error] = 'Failed to create new period detail, something went wrong'
    end 
    redirect_to @period
  end

  def remove_period_detail
    @period = PeriodDetail.find(params[:id]).period
    respond_to do |format|
      format.html { 
        if PeriodDetail.destroy(params[:id])
          flash[:notice] = 'Done'
        else
          flash[:error] = 'Failed to delete, something went wrong'
        end 
      }
    end
    redirect_to @period
  end

  def index
    @periods = Period.all
    respond_with(@periods)
  end

  def show
    @additional_year = @period.get_additional_years
    respond_with(@period)
  end

  def new
    @period = Period.new
    respond_with(@period)
  end

  def edit
    @additional_year = @period.get_additional_years
  end

  def create
    @period = Period.new(period_params)
    flash[:notice] = 'Period was successfully created.' if @period.save
    respond_with(@period)
  end

  def update
    flash[:notice] = 'Period was successfully updated.' if @period.update(period_params)
    respond_with(@period)
  end

  def destroy
    @period.destroy
    respond_with(@period)
  end

  private
  def set_period
    @period = Period.find(params[:id])
  end

  def period_params
    params.require(:period).permit(:franchise_id, :initial_month, :month_length, :number_of_blocks, :start_year, :name)
  end
end
