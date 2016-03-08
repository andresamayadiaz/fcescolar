class JoinCurricularLinesSubjects < ActiveRecord::Migration
  def change
  	create_table :curricular_lines_subjects, id: false do |t|
      t.belongs_to :curricular_line, index: true
      t.belongs_to :subject, index: true
    end
  end
end
