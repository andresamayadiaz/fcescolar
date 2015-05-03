class PeriodDetail < ActiveRecord::Base
  resourcify
  belongs_to :period

  validates :period, :initial_month, :end_month, :year, :presence => true

  def get_months
    months = []
    months << self.initial_month.strftime('%b')
    months << self.end_month.strftime('%b')
    months
  end
end
