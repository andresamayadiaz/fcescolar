class ContractsTemplatesController < ApplicationController
  load_and_authorize_resource
  before_action :set_contracts_template, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contracts_templates = ContractsTemplate.all
    respond_with(@contracts_templates)
  end

  def show
    respond_with(@contracts_template)
  end

  def new
    @contracts_template = ContractsTemplate.new
    respond_with(@contracts_template)
  end

  def edit
  end

  def create
    @contracts_template = ContractsTemplate.new(contracts_template_params)
    flash[:notice] = 'ContractsTemplate was successfully created.' if @contracts_template.save
    respond_with(@contracts_template) do |format|
      format.html { redirect_to contracts_templates_url }
    end
  end

  def update
    flash[:notice] = 'ContractsTemplate was successfully updated.' if @contracts_template.update(contracts_template_params)
    respond_with(@contracts_template) do |format|
      format.html { redirect_to contracts_templates_url }
    end
  end

  def destroy
    @contracts_template.destroy
    respond_with(@contracts_template)
  end

  private
    def set_contracts_template
      @contracts_template = ContractsTemplate.find(params[:id])
    end

    def contracts_template_params
      params.require(:contracts_template).permit(:franchise_id, :name, :content, :serie, :consecutive_init, :consecutive_next, :status)
    end
end
