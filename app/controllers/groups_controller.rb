class GroupsController < ApplicationController

  load_and_authorize_resource

  def unsubscribe
  end
  
  def create_unsubscribe
    if EnrolledStudent.find(params[:enrolled_student_id]).destroy
      flash[:notice] = 'The student is unsubscribed from that group'
    else
      flash[:alert] = 'Failed to unsubscribe student from that group'
    end
    redirect_to :back
  end
  
  def global_unsubscribe
  end

  def create_global_unsubscribe
    EnrolledStudent.all.select{|s|s.destroy if s.group_detail.group.study_plan.career_id==params[:career_id].to_i}
    redirect_to :back, notice: 'The sudent is unsubscribed from the career'
  rescue => e
    raise e
  end
  
  def load_group_subscription
    render :json => EnrolledStudent.load_group_subscription(params[:person_id])
  end
  
  def load_subscription
    render :json => EnrolledStudent.load_subscription(params[:person_id])
  end

  def load
    render :json => GroupDetail.load(params[:year],params[:month],params[:study_plan_id],params[:weekday],params[:student_ids])  
  end

  def search_student
    @search_result = Person.search_student(params)
    render :json => @search_result
  end

  def get_years_of_selected_study_plan
    study_plan = StudyPlan.find(params[:study_plan_id])
    render :json => study_plan.period.period_details.map{|pd|pd.year.strftime('%Y')}.uniq 
  end

  def get_months_of_selected_year
    render :json => PeriodDetail.get_month_range(params[:year])
  end

  def get_week_day_of_selected_month
    render :json => GroupDetail.get_related_weekday(params[:study_plan_id],params[:year],params[:month])
  end

  def load_latest_added_students #limit to 10
    render :json => UsersRole.get_latest_added_students 
  end

  def new_enroll_student
    @new_enrolled_student = EnrolledStudent.new
    @available_study_plans = StudyPlan.active.map{|sp|sp.enabled}.compact #because of removing career and franchise relation.
  end
  
  def create_enroll_student
    if params[:enrolled_student].present?
      enrolled = EnrolledStudent.add(params[:enrolled_student])
      enrolled ? flash[:notice]='Students with complete docs are enrolled' : flash[:alert]='Failed to enroll student'
    else
      flash[:alert]='No hay alumnos para inscribir'
    end
    redirect_to :back
  end

  def block_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Blocked')
    flash[:alert]='El grupo se encuentra bloqueado.'
    redirect_to :back
  end

  def unblock_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Open')
    flash[:notice]='El grupo ha cambiado a abierto.'
    redirect_to :back
  end

  def close_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Closed', :closer_id=>current_user.id, :closed_at=>Date.today)
    flash[:alert]='This group status is set to close now'
    redirect_to :back
  end

  def open_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Open')
    flash[:notice]='This group status is set to open now'
    redirect_to :back
  end
end
