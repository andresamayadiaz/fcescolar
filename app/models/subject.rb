class Subject < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :study_level
  belongs_to :curricular_line
end
