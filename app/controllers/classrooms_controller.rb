class ClassroomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @classrooms = Classroom.active
    respond_with(@classrooms)
  end

  def show
    respond_with(@classroom)
  end

  def new
    @classroom = Classroom.new
    respond_with(@classroom)
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)
    respond_with(@classroom) do |format|
      format.html { 
        if @classroom.save 
          flash[:notice] = 'Classroom was successfully created.' 
          redirect_to classrooms_url 
        else 
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@classroom) do |format|
      format.html { 
        if @classroom.update(classroom_params)
          flash[:notice] = 'Classroom was successfully updated.' 
          redirect_to classrooms_url 
        else 
          render 'edit'
        end
      }
    end
  end

  def destroy
    @classroom.update(:status=>false)
    respond_with(@classroom) do |format|
      format.html { redirect_to classrooms_url, notice: 'Deleted successfully' }
    end
  end

  private
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:franchise_id, :campus_id, :name, :max_capacity, :consecutive, :status)
  end
end
