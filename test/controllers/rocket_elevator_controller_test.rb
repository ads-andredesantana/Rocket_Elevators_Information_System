require 'test_helper'

class RocketElevatorControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get rocket_elevator_login_url
    assert_response :success
  end

end
