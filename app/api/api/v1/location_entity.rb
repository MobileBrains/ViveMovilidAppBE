require 'grape-entity'

module API
  module V1
    class LocationEntity < Grape::Entity
      expose :id
      expose :latitude
      expose :longitude
      expose :vehicle
      expose :created_at
    end
  end
end