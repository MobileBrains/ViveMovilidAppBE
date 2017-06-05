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

require 'test_helper'

class AssignedRouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
