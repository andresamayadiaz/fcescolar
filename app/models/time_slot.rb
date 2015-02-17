class TimeSlot < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :campus

  validates :franchise, :presence => true
  validates :campus, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validate :start_time_before_end_time

  before_save :generate_name

  def generate_name
  	self.name = "#{self.start_time.strftime('%H')}:#{self.start_time.strftime('%M')} – #{self.end_time.strftime('%H')}:#{self.end_time.strftime('%M')}"
  end

  def start_time_before_end_time
    errors.add(:start_time,"Hora de inicio debe estar antes de la hora de finalización") if start_time > end_time
  end
end
