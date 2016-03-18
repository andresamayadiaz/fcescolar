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

  validates :period, :presence => true
  validates :fecha_caducidad, :presence => true
  validate :unique_subject
  validates :acuerdo, length: {maximum: 15, message: "Acuerdo debe contener máximo de 15 digitos"}
  validates :beca, :inclusion => { :in => 10..50, message: "El valor debe ser entre 10% y 50 %" }

  def unique_subject
    arr_subjects = self.study_plan_periods.map{|x| x.study_plan_subjects}.flatten.map(&:subject_id)
    errors.add(:base, "Duplicated subject on same study plan") if arr_subjects.uniq.length!=arr_subjects.length
  end

  def is_enabled
    self.schedules.length>0 ? 'Enabled' : 'Not Enabled'
  end

  def enabled
    self if self.schedules.length>0
  end

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
