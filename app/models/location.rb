# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  vehicle_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  belongs_to :vehicle, :class_name => "Vehicle", foreign_key: :vehicle_id

  after_save{
              v = Vehicle.find(self.vehicle_id )
              v.update_attributes(:latitude => self.latitude, :longitude => self.longitude)
            }
end
