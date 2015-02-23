class PeriodDetail < ActiveRecord::Base
  belongs_to :period

  validates :period, :initial_month, :end_month, :year, :presence => true
end
