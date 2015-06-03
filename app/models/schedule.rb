class Schedule < ActiveRecord::Base
  belongs_to :study_plan
  belongs_to :campus
  has_and_belongs_to_many :background_official_docs
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :time_slots
  has_and_belongs_to_many :degree_achievements_categories

  validates :background_official_docs, :presence => true
  validates :classrooms, :presence => true
  validates :time_slots, :presence => true
  validates :degree_achievements_categories, :presence => true
end
