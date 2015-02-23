json.array!(@periods) do |period|
  json.extract! period, :id, :franchise_id, :initial_month, :month_length, :number_of_blocks, :start_year, :name
  json.url period_url(period, format: :json)
end
