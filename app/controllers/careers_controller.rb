class CareersController < ApplicationController
  load_and_authorize_resource
  before_action :set_career, only: [:show, :edit, :update, :destroy, :check_for_study_plan]

  respond_to :html

  def check_for_study_plan
    @existing_study_plan = @career.study_plans.active
    render :json => @existing_study_plan
  end

  def index
    @careers = Career.where(:status=>true)
    respond_with(@careers)
  end

  def show
    respond_with(@career)
  end

  def new
    @career = Career.new
    @subjects = []
    respond_with(@career)
  end

  def edit
    @subjects = Subject.by_study_level_id(@career.study_level_id)
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
    @career.update_attribute(:status,false)
    redirect_to careers_url, notice: 'Career is deleted successfully'
  end

  private
  def set_career
    @career = Career.find(params[:id])
  end

  def career_params
    params.require(:career).permit(:franchise_id, :name, :status, :rvoe, :study_level_id, :serie, :clave_estadistica, :clave_dgp, :auth_file, :subject_ids => [])
  end
end
