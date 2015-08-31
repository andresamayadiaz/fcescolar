class OfficersTeacherDictamination < ActiveRecord::Base
	belongs_to :officer
	belongs_to :teacher_dictamination
end
