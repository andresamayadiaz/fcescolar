json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :study_level_id, :curricular_line_id, :clave, :status
  json.url subject_url(subject, format: :json)
end
