class MapsController < ApplicationController
  #skip_before_action :authenticate_user!, :only => [:index_map,:updateLocations]

  def index_map
    @bus_locations = Vehicle.where.not(latitude: nil, longitude:nil )
     @hash = Gmaps4rails.build_markers(@bus_locations) do |bus_location, marker|
        marker.lat bus_location.latitude
        marker.lng bus_location.longitude
        marker.picture({
              "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
              "width" => 32,
              "height" => 32
            })
        marker.infowindow "Se scontruye a nuestro gusto<br>
                            <hr>
                            mas cosas blablabla <br>
                            <hr>
                            Numero Lateral: #{bus_location.lateral} "
     end
  end

  def updateLocations
    @bus_locations = Vehicle.where.not(latitude: nil, longitude:nil )
     @hash = Gmaps4rails.build_markers(@bus_locations) do |bus_location, marker|
        marker.lat bus_location.latitude
        marker.lng bus_location.longitude
        marker.picture({
              "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
              "width" => 32,
              "height" => 32
            })
        marker.infowindow "Se scontruye a nuestro gusto<br>
                            <hr>
                            mas cosas blablabla <br>
                            <hr>
                            Numero Lateral: #{bus_location.lateral} "
     end

    respond_to do |response|
      response.json { render json: @hash }
    end
  end

  def monitorFleet
    #c = Company.where(manager.id current_user.id)
    @company = Company.where(manager_id: current_user.id).last
    @fleet = @company.vehicle
    @bus_routes = @company.bus_route

    @hash = Gmaps4rails.build_markers(@fleet) do |bus, marker|
        marker.lat bus.latitude
        marker.lng bus.longitude
        marker.picture({
              "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
              "width" => 32,
              "height" => 32
            })
        marker.infowindow "Se scontruye a nuestro gusto<br>
                            <hr>
                            mas cosas blablabla <br>
                            <hr>
                            Numero Lateral: #{bus.lateral} "
     end
  end

  def updateMonitorFleet
    #c = Company.where(manager.id current_user.id)
    @company = Company.where(manager_id: current_user.id).last
    @fleet = @company.vehicle
    #TODO es mejor preguntar por la location y no tener que actualizar esos campos luego en el otro modelo
    @hash = Gmaps4rails.build_markers(@fleet) do |vehicle, marker|
        marker.lat vehicle.latitude
        marker.lng vehicle.longitude
        marker.picture({
              "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
              "width" => 32,
             "height" => 32
           })
       marker.infowindow "Se scontruye a nuestro gusto<br>
                           <hr>
                           mas cosas blablabla <br>
                           <hr>
                           Numero Lateral: #{vehicle.lateral} "
    end
    respond_to do |response|
      response.json { render json: @hash }
    end
  end

  def updateMonitorFleetPerBusRoute
    #c = Company.where(manager.id current_user.id)
    @company = Company.where(manager_id: current_user.id).last
    @bus_routes = BusRoute.where(company_id: @company.id).all
    busRouteId = BusRoute.where(name: params[:bus_route_name]).last.id
    @assignedRoutes = AssignedRoute.where(bus_route_id: busRouteId,company_id: @company.id).where("created_at >= ?", Time.zone.now.beginning_of_day)

    #TODO es mejor preguntar por la location y no tener que actualizar esos campos luego en el otro modelo
    @hash = Gmaps4rails.build_markers(@assignedRoutes) do |assignedRoute, marker|
        marker.lat assignedRoute.vehicle.latitude
        marker.lng assignedRoute.vehicle.longitude
        marker.picture({
              "url" => "http://icons.iconarchive.com/icons/icons-land/vista-map-markers/32/Map-Marker-Marker-Outside-Chartreuse-icon.png",
              "width" => 32,
              "height" => 32
            })
        marker.infowindow "Se scontruye a nuestro gusto<br>
                            <hr>
                            mas cosas blablabla <br>
                            <hr>
                            Numero Lateral: #{assignedRoute.vehicle.lateral} "
     end
    respond_to do |response|
      response.json { render json: @hash }
    end
  end

end
