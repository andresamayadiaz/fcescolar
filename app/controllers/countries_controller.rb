class CountriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @countries = Country.all
    respond_with(@countries)
  end

  def show
    respond_with(@country)
  end

  def new
    @country = Country.new
    respond_with(@country)
  end

  def edit
  end

  def create
    @country = Country.new(country_params)
    flash[:notice] = 'Pais creado con éxito.' if @country.save
    respond_with(@country) do |format|
      format.html { redirect_to countries_url }
    end
  end

  def update
    flash[:notice] = 'Pais actualizado con éxito.' if @country.update(country_params)
    respond_with(@country) do |format|
      format.html { redirect_to countries_url }
    end
  end

  def destroy
    @country.destroy
    respond_with(@country)
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :code)
    end
end
