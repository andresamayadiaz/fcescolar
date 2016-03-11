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

    @curricular_lines = []
    @study_levels = []
    respond_with(@subject)
  end

  def edit
    @curricular_lines = CurricularLine.all
    @study_levels = StudyLevel.all
  end

  def create
    @subject = Subject.new(subject_params)
    respond_with(@subject) do |format|
      format.html { 
        if @subject.save
          flash[:notice] = 'Materia creada con exito.' 
          redirect_to subjects_path 
        else 
          @curricular_lines = []
          @study_levels = []
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@subject) do |format|
      format.html { 
        if @subject.update(subject_params)
          flash[:notice] = 'Materia actualizada con exito.' 
          redirect_to subjects_path 
        else
           @curricular_lines = CurricularLine.all
            @study_levels = StudyLevel.all
          render 'edit'
        end
      }
    end
  end

  def get_selected_subjects
    @selected = Subject.get_selected(params[:ids])
    render :json => @selected 
  end

  def get_subjects_by_study_level
    #@subjects = Subject.by_study_level_id(params[:study_level_id])
    @subjects = Subject.includes(:study_levels).where('study_levels.id' => (params[:study_level_id]))
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
      params.require(:subject).permit(:name, :clave, :status, :curricular_line_ids => [], :study_level_ids => [])
    end
end
