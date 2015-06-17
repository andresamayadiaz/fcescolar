class DegreeAchievementsCategory < ActiveRecord::Base
  resourcify
  has_and_belongs_to_many :schedules
  scope :active, -> { where(status: true) }
end
