class OfficersController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @officers = Officer.all
    respond_with(@officers)
  end

  def show
    respond_with(@officer)
  end

  def new
    @officer = Officer.new
    respond_with(@officer)
  end

  def edit
  end

  def create
    @officer = Officer.new(officer_params)
    respond_with(@officer) do |format|
      format.html { 
        if @officer.save 
          flash[:notice] = 'Officer was successfully created.' 
          redirect_to officers_path 
        else 
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@officer) do |format|
      format.html { 
        if @officer.update(officer_params)
            flash[:notice] = 'Officer was successfully updated.'
            redirect_to officers_path
        else 
          render 'edit'
        end
      }
    end
  end

  def destroy
    @officer.destroy
    respond_with(@officer)
  end

  private
    def set_officer
      @officer = Officer.find(params[:id])
    end

    def officer_params
      params.require(:officer).permit(:title, :name, :last_name, :position, :dependency_level_1, :dependency_level_2, :dependency_level_3, :dependency_level_4, :dependency_level_5)
    end
end
