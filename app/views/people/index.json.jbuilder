json.array!(@people) do |person|
  json.extract! person, :id, :curp, :rfc, :email, :name, :fathers_maiden_name, :mothers_maiden_name, :country_id, :state_id, :birthday
  json.url person_url(person, format: :json)
end
