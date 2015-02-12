class Subject < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :study_level
  belongs_to :curricular_line
  has_and_belongs_to_many :careers
end
