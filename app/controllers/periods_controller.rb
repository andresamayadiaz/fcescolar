class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @periods = Period.all
    respond_with(@periods)
  end

  def show
    respond_with(@period)
  end

  def new
    @period = Period.new
    respond_with(@period)
  end

  def edit
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
