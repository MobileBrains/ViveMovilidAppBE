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

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
