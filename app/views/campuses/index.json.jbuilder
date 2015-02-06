json.array!(@campuses) do |campus|
  json.extract! campus, :id, :name, :address, :classrooms, :franchise_id
  json.url campus_url(campus, format: :json)
end
