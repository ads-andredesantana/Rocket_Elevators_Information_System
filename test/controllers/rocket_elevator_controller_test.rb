require 'test_helper'

class RocketElevatorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rocket_elevator_index_url
    assert_response :success
  end

end
