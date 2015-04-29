class AddEvidenceToTeacherDictaminations < ActiveRecord::Migration
  def change
    add_attachment :teacher_dictaminations, :evidence
  end
end
