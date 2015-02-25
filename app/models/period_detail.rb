class PeriodDetail < ActiveRecord::Base
  resourcify
  belongs_to :period

  validates :period, :initial_month, :end_month, :year, :presence => true
end
