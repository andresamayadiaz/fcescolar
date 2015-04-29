class ApprovedSubject < ActiveRecord::Base
  belongs_to :teacher_dictamination
  belongs_to :subject
end
