json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :franchise_id, :campus_id, :name, :max_capacity, :consecutive, :status
  json.url classroom_url(classroom, format: :json)
end
