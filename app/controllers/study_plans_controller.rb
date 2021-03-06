class StudyPlansController < ApplicationController
  before_action :set_study_plan, only: [:show, :edit, :update, :destroy]

  def filter
    @study_plans = StudyPlan.filter(params)
    @careers = Career.all
    @periods = Period.all
    render 'index'
  end

  def get_period_months_by_period_detail_id
    @period_months = PeriodDetail.find(params[:period_detail_id]).get_months
    render :json => @period_months
  end

  def get_period_years_by_study_plan_id
    @uniq_period_years = []
    period_years = StudyPlan.find(params[:study_plan_id]).period.period_details
    period_years.each do |py|
      @uniq_period_years << py if !@uniq_period_years.map{|i|i.year.strftime('%Y')}.include? py.year.strftime('%Y') 
    end
    render :json => @uniq_period_years
  end


  def get_active_classrooms_by_campus_id
    @active_classrooms = Classroom.where(:campus_id=>params[:campus_id]).active
    render :json => @active_classrooms
  end

  def get_active_time_slots_by_campus_id
    @active_time_slots = TimeSlot.where(:campus_id=>params[:campus_id]).active
    render :json => @active_time_slots
  end

  def enable
    @active_study_plans = StudyPlan.active
    @campuses = current_user.person.franchise.try(:campuses)
    @active_docs = BackgroundOfficialDoc.active
    @active_deg_categories = DegreeAchievementsCategory.active #because we remove relation to franchise
    @schedule = Schedule.new
  end

  def create_schedule
    @schedule = Schedule.new(params[:schedule])
    if @schedule.save
      flash[:notice]='Study plan is enabled'
    else
      flash[:alert]='Failed to enable study plan'
    end
    redirect_to :back
  end

  # GET /study_plans
  # GET /study_plans.json
  def get_subject_by_curricular_line
    @subjects = Subject.get_by_career(params[:career_id],params[:cl_id])
    render :json => @subjects
  end

  def get_subject_by_study_plan_id
    @subjects = StudyPlanSubject
  end

  def index
    @study_plans = StudyPlan.all
    @careers = Career.all
    @periods = Period.all
  end

  # GET /study_plans/1
  # GET /study_plans/1.json
  def show
    @enabled = @study_plan.schedules.present? ? true : false
    @schedule = @study_plan.schedules.last if @enabled #to get latest schedule
    if params[:pdf].present? and params[:pdf]=='1'
      @is_pdf = true
      render  :pdf => "Study Plan #{@study_plan.id}"
    end
  end

  # GET /study_plans/new
  def new
    @study_plan = StudyPlan.new
  end

  # GET /study_plans/1/edit
  def edit
  end

  # POST /study_plans
  # POST /study_plans.json
  def create
    @study_plan = StudyPlan.new(study_plan_params)
    respond_to do |format|
      if @study_plan.save
        format.html { redirect_to study_plans_url, notice: 'Study plan was successfully created.' }
        format.json { render :show, status: :created, location: @study_plan }
      else
        format.html { render :new }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_plans/1
  # PATCH/PUT /study_plans/1.json
  def update
    respond_to do |format|
      if @study_plan.update(study_plan_params)
        format.html { redirect_to edit_study_plan_url(@study_plan), notice: 'Study plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_plan }
      else
        format.html { render :edit }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_plans/1
  # DELETE /study_plans/1.json
  def destroy
    @study_plan.destroy
    respond_to do |format|
      format.html { redirect_to study_plans_url, notice: 'Study plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_study_plan
    @study_plan = StudyPlan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def study_plan_params
    params.require(:study_plan).permit(
      :id,
      :career_id,
      :period_id,
      :number_of_periods,
      :name,
      :attendance_rate,
      :extra_opportunities,
      officers_study_plans_attributes: [
        :id, 
        :study_plan_id, 
        :officer_id, 
        :rank,
        :_destroy
      ],
      study_plan_periods_attributes: [
        :id, 
        :period_name, 
        :curricular_line_id, 
        :study_plan_id,
        :_destroy,
        study_plan_subjects_attributes: [
          :id, 
          :study_plan_period_id, 
          :curricular_line_id, 
          :subject_id, 
          :name, 
          :weekly_frequency, 
          :credits,
          :_destroy
        ]
      ]
    )
  end
end
