json.array!(@study_plans) do |study_plan|
  json.extract! study_plan, :id
  json.url study_plan_url(study_plan, format: :json)
end
