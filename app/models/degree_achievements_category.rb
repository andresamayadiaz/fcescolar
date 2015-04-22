class DegreeAchievementsCategory < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  has_and_belongs_to_many :schedules
  scope :active, -> { where(status: true) }
end
