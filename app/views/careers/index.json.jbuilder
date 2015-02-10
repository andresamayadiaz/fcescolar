json.array!(@careers) do |career|
  json.extract! career, :id, :franchise_id, :name, :status, :rvoe, :study_level_id, :serie, :clave_estadistica, :clave_dgp, :auth_file
  json.url career_url(career, format: :json)
end
