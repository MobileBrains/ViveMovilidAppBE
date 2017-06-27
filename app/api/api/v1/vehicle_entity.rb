require 'grape-entity'

module API
  module V1
    class VehicleEntity < Grape::Entity
      expose :id
      expose :name
      expose :lateral_number
      expose :email
      expose :registration_plate
      expose :latitude
      expose :longitude
      expose :last_location
      expose :company_id
      expose :created_at
      expose :updated_at
    end
  end
end