class Classroom < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :campus
  has_and_belongs_to_many :schedules
  
  validates :franchise, :presence => true
  validates :campus, :presence => true

  before_create :generate_consecutive

  scope :active, -> { where(status: true) }
  
  def self.generate_id_and_name(actual_campus, study_plan_id)
    arr = []
    study_plan = StudyPlan.find(study_plan_id)
    if study_plan.enabled 
      arr_classroom_id = study_plan.schedules.last.classrooms.map(&:id)
    end
    classrooms = where(:campus_id=>actual_campus.id, :status=>true)
    classrooms.each do |d|
      arr << {:id=>d.id, :name=>d.name} if arr_classroom_id.include? d.id
    end
    arr
  end
  
  def generate_consecutive
  	self.consecutive = Classroom.where(:campus_id=>self.campus_id).length + 1
  end
end
