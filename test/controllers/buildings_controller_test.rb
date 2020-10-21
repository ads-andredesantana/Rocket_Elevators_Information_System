require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building = buildings(:one)
  end

  test "should get index" do
    get buildings_url
    assert_response :success
  end

  test "should get new" do
    get new_building_url
    assert_response :success
  end

  test "should create building" do
    assert_difference('Building.count') do
      post buildings_url, params: { building: { address_id: @building.address_id, customer_id: @building.customer_id, email_of_building_administrator: @building.email_of_building_administrator, full_name_of_building_administrator: @building.full_name_of_building_administrator, full_name_technical_contact: @building.full_name_technical_contact, phone_of_building_administrator: @building.phone_of_building_administrator, technical_contact_email: @building.technical_contact_email, technical_contact_phone: @building.technical_contact_phone } }
    end

    assert_redirected_to building_url(Building.last)
  end

  test "should show building" do
    get building_url(@building)
    assert_response :success
  end

  test "should get edit" do
    get edit_building_url(@building)
    assert_response :success
  end

  test "should update building" do
    patch building_url(@building), params: { building: { address_id: @building.address_id, customer_id: @building.customer_id, email_of_building_administrator: @building.email_of_building_administrator, full_name_of_building_administrator: @building.full_name_of_building_administrator, full_name_technical_contact: @building.full_name_technical_contact, phone_of_building_administrator: @building.phone_of_building_administrator, technical_contact_email: @building.technical_contact_email, technical_contact_phone: @building.technical_contact_phone } }
    assert_redirected_to building_url(@building)
  end

  test "should destroy building" do
    assert_difference('Building.count', -1) do
      delete building_url(@building)
    end

    assert_redirected_to buildings_url
  end
end
