# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "/tmp/fcescolar_background_jobs.log"
ENV['RAILS_ENV'] = "development"

every 1.day, :at => '12:05 am' do
    runner 'Contract.with_due_date_tomorrow'
end
every 1.day, :at => '12:10 am' do
    runner 'PersonalRecordFile.responsive_letter_with_due_date_yesterday_or_less'
end
every 1.month, :at => "start of the month at 01:00 am" do # Que día del mes?
    runner 'StudyPlan.notificar_caducidad_study_plan'
end