class PeriodDetail < ActiveRecord::Base
  resourcify
  belongs_to :period

  validates :period, :initial_month, :end_month, :year, :presence => true

  def get_months
    selected_year = self.year.strftime('%Y')
    selected_period_id = self.period_id
    selected_period_details = PeriodDetail.where('period_id=? and extract(year  from year) = ?',selected_period_id,selected_year)
    months =  selected_period_details.map{|spd| {:id=>spd.id, :month=>spd.initial_month.strftime('%b') } }
    months
  end
end
