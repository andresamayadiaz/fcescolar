class PeriodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def calculate_end_month
    month_to_add = (params[:month_length].to_i-1).to_i
    end_month = (Date.today.change(:month=>params[:initial_month].to_i)+month_to_add.months).month
    render :json => end_month
  end

  def add_period_detail
    @period = Period.find(params[:period_id])
    @new_period_detail = PeriodDetail.new(params.except(:controller,:action).permit!)
    if @new_period_detail.save
      flash[:notice] = 'New period detail has been added'
    else
      flash[:error] = 'Validation failed to create new period detail'
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
          flash[:error] = 'Failed to delete.'
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
