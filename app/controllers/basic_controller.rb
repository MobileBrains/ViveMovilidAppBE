class BasicController < ApplicationController
  layout "application"
  skip_before_action :authenticate_user!, :only => [:welcome, :updateVehicleLocations]

  def welcome
    #@bus_locations = Vehicle.where.not(latitude: nil, longitude:nil )
    @bus_routes = BusRoute.all
    # @hash = Gmaps4rails.build_markers(@bus_locations) do |bus_location, marker|
    #    marker.lat bus_location.latitude
    #    marker.lng bus_location.longitude
    #    marker.picture({
    #          "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
    #          "width" => 32,
    #          "height" => 32
    #        })
    #    marker.infowindow "Se scontruye a nuestro gusto<br>
    #                        <hr>
    #                        mas cosas blablabla <br>
    #                        <hr>
    #                        Numero Lateral: #{bus_location.lateral} "
    # end
  end

  def updateVehicleLocations
    busRouteName = params[:bus_route_name]
    busRouteId = BusRoute.where(name: busRouteName).last.id
    assignedRoutes = AssignedRoute.where(bus_route_id: busRouteId).where("created_at >= ?", Time.zone.now.beginning_of_day)
    @hash = Gmaps4rails.build_markers(assignedRoutes) do |assignedRoutes, marker|
        marker.lat assignedRoutes.vehicle.latitude
        marker.lng assignedRoutes.vehicle.longitude
        marker.picture({
              "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
              "width" => 32,
              "height" => 32
            })
        marker.infowindow "Ruta: #{assignedRoutes.bus_route.name}<br>
                            <hr>
                            #{assignedRoutes.bus_route.description} <br>
                            <hr>
                            Numero Lateral: #{assignedRoutes.vehicle.lateral} "
     end

     respond_to do |response|
        response.json { render json: @hash}
     end

  end

end
