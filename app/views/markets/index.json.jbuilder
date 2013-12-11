json.array!(@markets) do |market|
  json.extract! market, :id, :name, :website, :street, :city, :state, :zip, :latitude, :longitude, :location, :credit, :bakedgoods, :maple, :meat, :nursery, :nuts, :plants, :poultry, :prepared, :soap, :trees, :wine, :updatetime
  json.url market_url(market, format: :json)
end
