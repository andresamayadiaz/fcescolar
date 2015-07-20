class BackgroundOfficialDoc < ActiveRecord::Base
  resourcify
  belongs_to :franchise

  has_and_belongs_to_many :schedules
  before_destroy { schedules.clear }

  scope :active, -> { where(status: true) }

end
