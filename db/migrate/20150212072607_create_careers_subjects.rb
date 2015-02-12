class CreateCareersSubjects < ActiveRecord::Migration
  def change
    create_table :careers_subjects, id: false do |t|
      t.belongs_to :career, index: true
      t.belongs_to :subject, index: true
    end
  end
end
