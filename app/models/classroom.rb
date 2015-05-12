class Classroom < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :campus
  has_and_belongs_to_many :schedules
  
  validates :franchise, :presence => true
  validates :campus, :presence => true

  before_create :generate_consecutive

  scope :active, -> { where(status: true) }
  
  def self.generate_id_and_name(actual_campus)
    arr = []
    classrooms = where(:campus_id=>actual_campus.id, :status=>true)
    classrooms.each do |d|
      arr << {:id=>d.id, :name=>d.name}
    end
  end
  
  def generate_consecutive
  	self.consecutive = Classroom.where(:campus_id=>self.campus_id).length + 1
  end
end
