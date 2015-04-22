class CreateBackgroundOfficialDocsSchedules < ActiveRecord::Migration
  def change
    create_table :background_official_docs_schedules do |t|
      t.belongs_to :background_official_doc
      t.belongs_to :schedule, index: true
    end
    add_index :background_official_docs_schedules, :background_official_doc_id, name: 'official_doc_id'
  end
end
