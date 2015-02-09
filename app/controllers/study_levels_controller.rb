class StudyLevelsController < ApplicationController
  before_action :set_study_level, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @study_levels = StudyLevel.all
    respond_with(@study_levels)
  end

  def show
    respond_with(@study_level)
  end

  def new
    @study_level = StudyLevel.new
    respond_with(@study_level)
  end

  def edit
  end

  def create
    @study_level = StudyLevel.new(study_level_params)
    @study_level.save
    respond_with(@study_level) do |format|
      format.html { redirect_to study_levels_url }
    end
  end

  def update
    @study_level.update(study_level_params)
    respond_with(@study_level) do |format|
      format.html { redirect_to study_levels_url }
    end
  end

  def destroy
    @study_level.destroy
    respond_with(@study_level)
  end

  private
    def set_study_level
      @study_level = StudyLevel.find(params[:id])
    end

    def study_level_params
      params.require(:study_level).permit(:franchise_id, :name, :status)
    end
end
