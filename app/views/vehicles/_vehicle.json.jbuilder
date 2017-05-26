json.extract! vehicle, :id, :name, :lateral_number, :registration_plate, :latitude, :longitude, :last_location, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
