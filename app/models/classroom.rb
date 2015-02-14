class Classroom < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :campus
  validates :campus, :presence => true

  before_create :generate_consecutive

  def generate_consecutive
  	self.consecutive = Classroom.where(:campus_id=>self.campus_id).length + 1
  end
end
