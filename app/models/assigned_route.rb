class AssignedRoute < ApplicationRecord
  belongs_to :company
  belongs_to :vehicle
  belongs_to :bus_route
  belongs_to :driver, :class_name => "User", foreign_key: :driver_id
  belongs_to :assigned_by, :class_name => "User", foreign_key: :assigned_by_id

end
