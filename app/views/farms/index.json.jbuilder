json.array!(@farms) do |farm|
  json.extract! farm, :id, :name, :location, :address, :city, :state, :zip, :county, :country, :owner, :phone, :certifications, :website
  json.url farm_url(farm, format: :json)
end
