# == Schema Information
#
# Table name: vehicles
#
#  id                 :integer          not null, primary key
#  name               :string
#  lateral_number     :string
#  registration_plate :string
#  latitude           :float
#  longitude          :float
#  last_location      :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :integer
#

class Vehicle < ApplicationRecord
  belongs_to :company, :class_name => "Company", foreign_key: :company_id
  has_many :location
  has_many :assigned_route


  reverse_geocoded_by :latitude, :longitude, :address => :last_location
  after_validation :reverse_geocode, if: -> {self.longitude.present? and self.latitude.present? and self.longitude_changed? or self.latitude_changed?  }   # auto-fetch address
end

