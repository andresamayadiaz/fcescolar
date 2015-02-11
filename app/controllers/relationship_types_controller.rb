class RelationshipTypesController < ApplicationController
  before_action :set_relationship_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @relationship_types = RelationshipType.all
    respond_with(@relationship_types)
  end

  def show
    respond_with(@relationship_type)
  end

  def new
    @relationship_type = RelationshipType.new
    respond_with(@relationship_type)
  end

  def edit
  end

  def create
    @relationship_type = RelationshipType.new(relationship_type_params)
    flash[:notice] = 'RelationshipType was successfully created.' if @relationship_type.save
    respond_with(@relationship_type) do |format|
      format.html { redirect_to relationship_types_url }
    end
  end

  def update
    flash[:notice] = 'RelationshipType was successfully updated.' if @relationship_type.update(relationship_type_params)
    respond_with(@relationship_type) do |format|
      format.html { redirect_to relationship_types_url }
    end
  end

  def destroy
    @relationship_type.destroy
    respond_with(@relationship_type)
  end

  private
    def set_relationship_type
      @relationship_type = RelationshipType.find(params[:id])
    end

    def relationship_type_params
      params.require(:relationship_type).permit(:franchise_id, :name, :status)
    end
end
