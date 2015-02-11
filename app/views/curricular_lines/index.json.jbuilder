json.array!(@curricular_lines) do |curricular_line|
  json.extract! curricular_line, :id, :franchise_id, :name, :status
  json.url curricular_line_url(curricular_line, format: :json)
end
