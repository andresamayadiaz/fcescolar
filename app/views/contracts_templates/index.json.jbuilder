json.array!(@contracts_templates) do |contracts_template|
  json.extract! contracts_template, :id, :franchise_id, :name, :content, :serie, :consecutive_init, :consecutive_next, :status
  json.url contracts_template_url(contracts_template, format: :json)
end
