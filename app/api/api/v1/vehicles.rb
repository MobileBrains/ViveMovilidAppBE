module API
  module V1
    class Vehicles < Grape::API
      #include Defaults
      include APIDefaults
      include APIGuard

      guard_all!

      resource :vehicles do


        desc "Return all vehicles"
        get "" do
          vehicles = Vehicle.all
          present :vehicles, vehicles, with: VehicleEntity
        end

        desc "Return a vehicle by ID"
        params do
          requires :id, type: String, desc: "ID of the vehicle"
        end
        get ":id", root: "vehicle" do
          vehicle = Vehicle.where(id: permitted_params[:id]).first!
          present :vehicles, vehicle, with: VehicleEntity
        end
      end
    end
  end
end