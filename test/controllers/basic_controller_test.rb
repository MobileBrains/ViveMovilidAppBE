require 'test_helper'

class BasicControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get basic_welcome_url
    assert_response :success
  end

end
