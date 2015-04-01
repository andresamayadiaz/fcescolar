class StudyPlan < ActiveRecord::Base
  belongs_to :career
  belongs_to :period

  scope :active, -> { where(status: true) } 
end
