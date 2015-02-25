class FranchisesController < ApplicationController
  load_and_authorize_resource
  before_action :set_franchise, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @franchises = Franchise.all
    respond_with(@franchises)
  end

  def show
    respond_with(@franchise)
  end

  def new
    @franchise = Franchise.new
    respond_with(@franchise)
  end

  def edit
  end

  def create
    @franchise = Franchise.new(franchise_params)
    flash[:notice] = 'Franchise was successfully created.' if @franchise.save
    respond_with(@franchise) do |format|
      format.html { redirect_to franchises_url }
    end
  end

  def update
    flash[:notice] = 'Franchise was successfully updated.' if @franchise.update(franchise_params)
    respond_with(@franchise) do |format|
      format.html { redirect_to franchises_url }
    end
  end

  def destroy
    @franchise.destroy
    respond_with(@franchise)
  end

  private
  def set_franchise
    @franchise = Franchise.find(params[:id])
  end

  def franchise_params
    params.require(:franchise).permit(:name, :clave_dgp, :address)
  end
end