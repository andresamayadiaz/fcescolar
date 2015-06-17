class SubjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @subjects = Subject.all
    respond_with(@subjects)
  end

  def show
    respond_with(@subject)
  end

  def new
    @subject = Subject.new
    respond_with(@subject)
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    respond_with(@subject) do |format|
      format.html { redirect_to subjects_url }
    end
  end

  def update
    @subject.update(subject_params)
    respond_with(@subject) do |format|
      format.html { redirect_to subjects_url }
    end
  end

  def get_selected_subjects
    @selected = Subject.get_selected(params[:ids])
    render :json => @selected 
  end

  def get_subjects_by_study_level
    @subjects = Subject.by_study_level_id(params[:study_level_id])
    render :json => @subjects
  end

  def destroy
    @subject.destroy
    respond_with(@subject)
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :study_level_id, :curricular_line_id, :clave, :status)
    end
end
