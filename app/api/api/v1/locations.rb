module API
  module V1
    class Locations < Grape::API
      #include Defaults
      include APIDefaults
      include APIGuard

      guard_all!

        desc "Update user location"
        params do
          requires :latitude, type: Float, desc: "Latitude coordinates"
          requires :longitude, type: Float, desc: "Longitude coordinates"
        end
        post "/updateLocation" do
          vehicle = Vehicle.where(:id => current_user.id).first
          if vehicle.present?
            vehicle.update_attributes(:latitude => permitted_params[:latitude], :longitude => permitted_params[:longitude])

            location = Location.create({  latitude: permitted_params[:latitude],
                                          longitude: permitted_params[:longitude],
                                          vehicle_id: current_user.id})
            location.save
            #put the pusher trigger here!
            present :location, location, with: LocationEntity
          else
            return "No fue posible actualizar ubicacion, intente de nuevo."
          end
        end
    end
  end
end