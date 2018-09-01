require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index_map" do
    get maps_index_map_url
    assert_response :success
  end

end
