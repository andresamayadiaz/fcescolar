class BackgroundJob
  
  def responsive_letter_with_due_date_yesterday_or_less
    responsive_letters = PersonalRecordFile.where('is_responsive_letter = 1 and (due_date = ? or due_date = ?)', Date.today-1.days, Date.today)
    if responsive_letters.present?
      responsive_letters.each do |rl|
        puts '------------------'
        puts rl.due_date
        puts '-------------------'
      end
    end
  end
  handle_asynchronously :responsive_letter_with_due_date_yesterday_or_less, :run_at => Proc.new { 1.minutes.from_now }

end
