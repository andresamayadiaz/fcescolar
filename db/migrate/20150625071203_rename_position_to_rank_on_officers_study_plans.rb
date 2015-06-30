class RenamePositionToRankOnOfficersStudyPlans < ActiveRecord::Migration
  def change
    rename_column :officers_study_plans, :position, :rank
  end
end
