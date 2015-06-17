json.array!(@officers) do |officer|
  json.extract! officer, :id, :title, :last_name, :position, :dependency_level_1, :dependency_level_2, :dependency_level_3, :dependency_level_4, :dependency_level_5
  json.url officer_url(officer, format: :json)
end
