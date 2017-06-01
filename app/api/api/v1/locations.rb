module API
  module V1
    class Locations < Grape::API
      include Defaults

        desc "Update user location"
        params do
          requires :latitude, type: Float, desc: "Latitude coordinates"
          requires :longitude, type: Float, desc: "Longitude coordinates"
          requires :vehicle_id, type: Integer, desc: "vehicle id"
        end
        post "/updateLocation" do
          vehicle = Vehicle.where(:id => permitted_params[:vehicle_id]).first
          if vehicle.present?
            vehicle.update_attributes(:latitude => permitted_params[:latitude], :longitude => permitted_params[:longitude])

            location = Location.create({  latitude: permitted_params[:latitude],
                                          longitude: permitted_params[:longitude],
                                          vehicle_id: permitted_params[:vehicle_id]})
            location.save
            present :location, location, with: LocationEntity
          else
            return "No fue posible actualizar ubicacion, intente de nuevo."
          end
        end
    end
  end
end