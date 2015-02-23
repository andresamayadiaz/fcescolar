class PeriodDetail < ActiveRecord::Base
  belongs_to :period

  def self.create_single_record(p)
  	PeriodDetail.create!(p.except(:controller,:action).permit!) #to be edited later
  end
end
