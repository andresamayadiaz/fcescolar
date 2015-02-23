class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy, :add_period_detail]

  respond_to :html

  def add_period_detail
    byebug
  end

  def remove_period_detail
    @period = PeriodDetail.find(params[:id]).period
    respond_to do |format|
      format.html { 
        if PeriodDetail.destroy(params[:id])
          flash[:notice] = 'Done'
        else
          flash[:notice] = 'Failed to delete, something went wrong'
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
    @additional_year = @period.period_details.last.end_month+1.month
    respond_with(@period)
  end

  def new
    @period = Period.new
    respond_with(@period)
  end

  def edit
    @additional_year = @period.period_details.last.end_month+1.month
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
