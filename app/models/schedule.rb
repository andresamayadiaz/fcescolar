class Schedule < ActiveRecord::Base
  belongs_to :study_plan
  belongs_to :campus

  has_and_belongs_to_many :background_official_docs
  before_destroy { background_official_docs.clear }
  
  has_and_belongs_to_many :classrooms
  before_destroy { classrooms.clear }
  
  has_and_belongs_to_many :time_slots
  before_destroy { time_slots.clear }
  
  has_and_belongs_to_many :degree_achievements_categories
  before_destroy { degree_achievements_categories.clear }
  
  validates :background_official_docs, :presence => true
  validates :classrooms, :presence => true
  validates :time_slots, :presence => true
  validates :degree_achievements_categories, :presence => true
end
