class JoinStudyLevelSubjects < ActiveRecord::Migration
  def change
  	create_table :study_levels_subjects, id: false do |t|
      t.belongs_to :study_level, index: true
      t.belongs_to :subject, index: true
    end
  end
end
