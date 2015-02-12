class CareersController < ApplicationController
  before_action :set_career, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @careers = Career.all
    respond_with(@careers)
  end

  def show
    respond_with(@career)
  end

  def new
    @career = Career.new
    respond_with(@career)
  end

  def edit
  end

  def create
    @career = Career.new(career_params)
    respond_with(@career) do |format|
      format.html { 
        if @career.save 
          redirect_to careers_url 
        else 
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@career) do |format|
      format.html { 
        if @career.update(career_params)
          redirect_to careers_url
        else
          render 'edit'
        end 
      }
    end
  end

  def destroy
    @career.destroy
    respond_with(@career)
  end

  private
  def set_career
    @career = Career.find(params[:id])
  end

  def career_params
    params.require(:career).permit(:franchise_id, :name, :status, :rvoe, :study_level_id, :serie, :clave_estadistica, :clave_dgp, :auth_file, :subject_ids => [])
  end
end
