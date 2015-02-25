json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :last_academic_degree, :country_id, :state_id, :street, :external, :internal, :colonia, :cp, :city, :emergency_phone, :additional_email_1, :additional_email_2, :phones_1, :phone_type_1, :phones_2, :phone_type_2
  json.url profile_url(profile, format: :json)
end
