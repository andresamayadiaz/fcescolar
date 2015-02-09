json.array!(@study_levels) do |study_level|
  json.extract! study_level, :id, :franchise_id, :name, :status
  json.url study_level_url(study_level, format: :json)
end
