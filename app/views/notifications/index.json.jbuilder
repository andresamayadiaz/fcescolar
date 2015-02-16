json.array!(@notifications) do |notification|
  json.extract! notification, :id, :franchise_id, :user_id, :title, :message, :destination_role
  json.url notification_url(notification, format: :json)
end
