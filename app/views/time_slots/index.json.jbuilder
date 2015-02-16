json.array!(@time_slots) do |time_slot|
  json.extract! time_slot, :id, :franchise_id, :name, :start_time, :end_time, :status
  json.url time_slot_url(time_slot, format: :json)
end
