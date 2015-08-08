class AddIndexToPeriodDetails < ActiveRecord::Migration
  def change
     execute "ALTER TABLE `period_details` ADD UNIQUE `unique_index`(`initial_month`, `end_month`, `year`, `period_id`);"
  end
end
