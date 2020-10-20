require 'test_helper'

class ElevatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elevator = elevators(:one)
  end

  test "should get index" do
    get elevators_url
    assert_response :success
  end

  test "should get new" do
    get new_elevator_url
    assert_response :success
  end

  test "should create elevator" do
    assert_difference('Elevator.count') do
      post elevators_url, params: { elevator: { CertificateOfInpection: @elevator.CertificateOfInpection, ColumnId_id: @elevator.ColumnId_id, DateOfCommissioning: @elevator.DateOfCommissioning, DateOfLastInspection: @elevator.DateOfLastInspection, Information: @elevator.Information, Model: @elevator.Model, Notes: @elevator.Notes, PropertyType: @elevator.PropertyType, Status: @elevator.Status, serialNumber: @elevator.serialNumber } }
    end

    assert_redirected_to elevator_url(Elevator.last)
  end

  test "should show elevator" do
    get elevator_url(@elevator)
    assert_response :success
  end

  test "should get edit" do
    get edit_elevator_url(@elevator)
    assert_response :success
  end

  test "should update elevator" do
    patch elevator_url(@elevator), params: { elevator: { CertificateOfInpection: @elevator.CertificateOfInpection, ColumnId_id: @elevator.ColumnId_id, DateOfCommissioning: @elevator.DateOfCommissioning, DateOfLastInspection: @elevator.DateOfLastInspection, Information: @elevator.Information, Model: @elevator.Model, Notes: @elevator.Notes, PropertyType: @elevator.PropertyType, Status: @elevator.Status, serialNumber: @elevator.serialNumber } }
    assert_redirected_to elevator_url(@elevator)
  end

  test "should destroy elevator" do
    assert_difference('Elevator.count', -1) do
      delete elevator_url(@elevator)
    end

    assert_redirected_to elevators_url
  end
end
