json.extract! bus_route, :id, :name, :description, :image_url, :created_at, :updated_at
json.url bus_route_url(bus_route, format: :json)
