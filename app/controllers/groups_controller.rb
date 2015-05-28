class GroupsController < ApplicationController

  load_and_authorize_resource

  def get_years_of_selected_study_plan
    study_plan = StudyPlan.find(params[:study_plan_id])
    render :json => study_plan.period.period_details.map{|pd|pd.year.strftime('%Y')}.uniq 
  end

  def get_months_of_selected_year
    render :json => PeriodDetail.get_month_range(params[:year])
  end

  def new_enroll_student
    @available_study_plans = current_user.person.franchise.careers.map{|c| c.study_plans.active.map{|sp|sp} }.flatten.uniq { |sp| sp.name }
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
