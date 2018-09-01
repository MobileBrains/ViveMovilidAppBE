# == Schema Information
#
# Table name: assigned_routes
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  vehicle_id     :integer
#  bus_route_id   :integer
#  driver_id      :integer
#  assigned_by_id :integer
#  departure_time :datetime
#  arrival_time   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AssignedRoute < ApplicationRecord
  belongs_to :company
  belongs_to :vehicle
  belongs_to :bus_route
  belongs_to :driver, :class_name => "User", foreign_key: :driver_id
  belongs_to :assigned_by, :class_name => "User", foreign_key: :assigned_by_id

end
