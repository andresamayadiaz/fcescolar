class PeriodDetail < ActiveRecord::Base
  belongs_to :period

  validates :period, :initial_month, :end_month, :year, :presence => true

  def self.create_single_record(p)
  	PeriodDetail.create!(p.except(:controller,:action).permit!) #to be edited later
  end
end
