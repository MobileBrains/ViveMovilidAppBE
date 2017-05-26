class Vehicle < ApplicationRecord
  has_many :location
  belongs_to :company, :class_name => "Company", foreign_key: :company_id

  reverse_geocoded_by :latitude, :longitude, :address => :last_location
  after_validation :reverse_geocode, if: -> {self.longitude.present? and self.latitude.present? and self.longitude_changed? or self.latitude_changed?  }   # auto-fetch address
end

