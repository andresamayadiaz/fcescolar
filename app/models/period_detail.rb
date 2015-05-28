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

  def self.get_month_range(selected_year)
    period_details = where('extract(year from year) = ?',selected_year)
    return period_details.map{|period_detail| {:id=>period_detail.id, :month=>"#{period_detail.initial_month.strftime('%B')} - #{period_detail.end_month.strftime('%B')}" } }
  end

end
