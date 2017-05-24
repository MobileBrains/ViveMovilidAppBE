json.extract! vehicle, :id, :lateral_number, :registration_plate, :latitude, :longitude, :location, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
