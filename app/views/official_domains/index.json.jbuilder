json.array!(@official_domains) do |official_domain|
  json.extract! official_domain, :id, :franchise_id, :name, :status
  json.url official_domain_url(official_domain, format: :json)
end
