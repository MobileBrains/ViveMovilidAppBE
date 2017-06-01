class BusRoute < ApplicationRecord
  belongs_to :company
  has_many :assigned_route
end
