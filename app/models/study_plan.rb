class StudyPlan < ActiveRecord::Base
  belongs_to :career
  belongs_to :period
  has_many :study_plan_periods
  has_many :schedules
  has_many :officers_study_plans
  has_many :officers, through: :officers_study_plans
  scope :active, -> { where(status: true) } 

  accepts_nested_attributes_for :study_plan_periods, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :officers_study_plans, :reject_if => :all_blank, :allow_destroy => true

  def self.filter(p)
    filtered_study_plans = all
    return filtered_study_plans if p[:career].blank? and p[:period].blank? and p[:status].blank?
    if p[:career].present? and p[:period].present?
      filtered_study_plans = StudyPlan.where(:career_id=>p[:career],:period_id=>p[:period])
    end
    if p[:career].present? and p[:period].blank?
      filtered_study_plans = StudyPlan.where(:career_id=>p[:career])
    end
    if p[:career].blank? and p[:period].present?
      filtered_study_plans = StudyPlan.where(:period_id=>p[:period])
    end
    if p[:status]=='enabled'
      filtered_study_plans = filtered_study_plans.select{|x| x.schedules.exists? }
    end
    if p[:status]=='not_enabled'
      filtered_study_plans = filtered_study_plans.select{|x| !x.schedules.exists? }
    end
    filtered_study_plans
  end
end
