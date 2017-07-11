json.extract! location, :id, :lat, :lng, :name, :expires_at, :created_at, :updated_at
json.url location_url(location, format: :json)
