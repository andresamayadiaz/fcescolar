class ClassroomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def filter_campus
    if params[:campus_id].present?
      @classrooms = Classroom.where(:campus_id=>params[:campus_id]).active
      @campus = Campus.all
      render 'index'
    else
      redirect_to classrooms_path
    end
  end

  def index
    @classrooms = Classroom.active
    if current_user.active_role=='super_administrator'
      @classrooms = @classrooms.select{|c| c.franchise_id==session[:active_franchise].to_i }
      @campus = Campus.where(:franchise_id=>session[:active_franchise].to_i)
    else
      @classrooms = @classrooms.select{|c| c.franchise_id==current_user.person.franchise_id }
      @campus = Campus.where(:franchise_id=>current_user.person.franchise_id)
    end
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
          flash[:notice] = 'Aula creada con exito.' 
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
          flash[:notice] = 'Aula actualizada con exito.' 
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
