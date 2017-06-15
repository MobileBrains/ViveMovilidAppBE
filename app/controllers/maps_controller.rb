class MapsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index_map,:updateLocations]

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
                            Numero Lateral: #{bus_location.lateral_number} "
     end
  end

  def updateLocations
    @bus_locations = Vehicle.where.not(latitude: nil, longitude:nil ).last
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
                            Numero Lateral: #{bus_location.lateral_number} "
     end

    respond_to do |response|
      response.json { render json: @hash }
    end
  end

end
