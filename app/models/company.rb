class Company < ApplicationRecord
  has_many :vehicle
  has_many :bus_route
end
