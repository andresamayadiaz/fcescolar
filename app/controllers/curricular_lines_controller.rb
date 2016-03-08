class CurricularLinesController < ApplicationController
  load_and_authorize_resource
  before_action :set_curricular_line, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @curricular_lines = CurricularLine.all
    respond_with(@curricular_lines)
  end

  def show
    respond_with(@curricular_line)
  end

  def new
    @curricular_line = CurricularLine.new
    respond_with(@curricular_line)
  end

  def edit
  end

  def create
    @curricular_line = CurricularLine.new(curricular_line_params)
    @curricular_line.save
    respond_with(@curricular_line) do |format|
      format.html { redirect_to curricular_lines_url }
    end
  end

  def update
    @curricular_line.update(curricular_line_params)
    respond_with(@curricular_line) do |format|
      format.html { redirect_to curricular_lines_url }
    end
  end

  def destroy
    @curricular_line.destroy
    respond_with(@curricular_line)
  end

  def get_curricular_lines
    @curricular_lines = CurricularLine.all
    render :json => @curricular_lines
  end

  def get_cl_selected
    @selected = CurricularLine.get_cl_selected(params[:ids])
    render :json => @selected 
  end

  private
    def set_curricular_line
      @curricular_line = CurricularLine.find(params[:id])
    end

    def curricular_line_params
      params.require(:curricular_line).permit(:franchise_id, :name, :status)
    end
end
