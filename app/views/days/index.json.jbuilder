json.array!(@days) do |day|
  json.extract! day, :id, :name
  json.url trip_url(day, format: :json)
end
