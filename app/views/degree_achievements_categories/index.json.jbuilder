json.array!(@degree_achievements_categories) do |degree_achievements_category|
  json.extract! degree_achievements_category, :id, :name, :status
  json.url degree_achievements_category_url(degree_achievements_category, format: :json)
end
