# == Schema Information
#
# Table name: bus_routes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#

require 'test_helper'

class BusRouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
