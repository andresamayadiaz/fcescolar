class CareersController < ApplicationController
  load_and_authorize_resource
  before_action :set_career, only: [:show, :edit, :update, :destroy, :check_for_study_plan, :download]

  respond_to :html

  def download
    file = open("#{Rails.root}/public#{@career.auth_file.url(:original, timestamp: false)}")
    send_file file
  end

  def check_for_study_plan
    @existing_study_plan = @career.study_plans.active
    render :json => @existing_study_plan.to_json(:include=> [:study_plan_periods => {:include=>[:study_plan_subjects]}])
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
    @subjects = Subject.all()
  end

  def create
    @career = Career.new(career_params)
    respond_with(@career) do |format|
      format.html { 
        if @career.save 
          case params[:commit]
            when 'save'
              redirect_to careers_url
            when 'save_and_select_subjects'
              redirect_to "#{edit_career_url(@career)}#retab2"
            else
              redirect_to careers_url
          end
        else 
          @subjects = @career.subjects
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
    params.require(:career).permit(:name, :status, :rvoe, :study_level_id, :serie, :clave_estadistica, :clave_dgp, :auth_file, :subject_ids => [])
  end
end
