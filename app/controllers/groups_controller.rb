class GroupsController < ApplicationController

  load_and_authorize_resource

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
    @available_study_plans = current_user.person.franchise.careers.map{|c| c.study_plans.active.map{|sp|sp} }.flatten.uniq { |sp| sp.name }
  end
  
  def create_enroll_student
    if params[:enrolled_student].present?
      enrolled = EnrolledStudent.add(params[:enrolled_student])
      enrolled ? flash[:notice]='All students are enrolled' : flash[:alert]='Failed to enroll student'
    else
      flash[:alert]='No student to enroll'
    end
    redirect_to :back
  end

  def block_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Blocked')
    flash[:alert]='This group is blocked now'
    redirect_to :back
  end

  def unblock_it
    group_detail = GroupDetail.find(params[:group_detail_id])
    group_detail.update(:status=>'Open')
    flash[:notice]='This group status is set to open now'
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
