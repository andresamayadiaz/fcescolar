json.array!(@studies) do |study|
  json.extract! study, :id, :name, :status, :franchise_id
  json.url study_url(study, format: :json)
end
