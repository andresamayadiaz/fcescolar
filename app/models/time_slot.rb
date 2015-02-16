class TimeSlot < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :campus

  validates :franchise, :presence => true
  validates :campus, :presence => true

  before_save :generate_name

  def generate_name
  	self.name = "#{self.start_time.hour}:#{self.start_time.min} – #{self.end_time.hour}:#{self.end_time.min}"
  end
end
