class Schedule < ActiveRecord::Base
  belongs_to :study_plan
  belongs_to :campus
  has_and_belongs_to_many :background_official_docs
  has_and_belongs_to_many :classrooms
end
