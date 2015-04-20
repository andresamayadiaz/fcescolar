class Schedule < ActiveRecord::Base
  belongs_to :study_plan
  belongs_to :campus
end
