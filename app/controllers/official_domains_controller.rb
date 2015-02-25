class OfficialDomainsController < ApplicationController
  load_and_authorize_resource
  before_action :set_official_domain, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @official_domains = OfficialDomain.all
    respond_with(@official_domains)
  end

  def show
    respond_with(@official_domain)
  end

  def new
    @official_domain = OfficialDomain.new
    respond_with(@official_domain)
  end

  def edit
  end

  def create
    @official_domain = OfficialDomain.new(official_domain_params)
    @official_domain.save
    respond_with(@official_domain) do |format|
      format.html { redirect_to official_domains_url }
    end
  end

  def update
    @official_domain.update(official_domain_params)
    respond_with(@official_domain) do |format|
      format.html { redirect_to official_domains_url }
    end
  end

  def destroy
    @official_domain.destroy
    respond_with(@official_domain)
  end

  private
    def set_official_domain
      @official_domain = OfficialDomain.find(params[:id])
    end

    def official_domain_params
      params.require(:official_domain).permit(:franchise_id, :name, :status)
    end
end
