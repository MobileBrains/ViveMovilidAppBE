class Company < ApplicationRecord
  has_many :vehicle
  has_many :bus_route
  has_many :assigned_route
end
