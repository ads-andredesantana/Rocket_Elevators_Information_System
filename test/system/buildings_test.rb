require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @building = buildings(:one)
  end

  test "visiting the index" do
    visit buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "creating a Building" do
    visit buildings_url
    click_on "New Building"

    fill_in "Address", with: @building.address_id
    fill_in "Customer", with: @building.customer_id
    fill_in "Email of building administrator", with: @building.email_of_building_administrator
    fill_in "Full name of building administrator", with: @building.full_name_of_building_administrator
    fill_in "Full name technical contact", with: @building.full_name_technical_contact
    fill_in "Phone of building administrator", with: @building.phone_of_building_administrator
    fill_in "Technical contact email", with: @building.technical_contact_email
    fill_in "Technical contact phone", with: @building.technical_contact_phone
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "updating a Building" do
    visit buildings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @building.address_id
    fill_in "Customer", with: @building.customer_id
    fill_in "Email of building administrator", with: @building.email_of_building_administrator
    fill_in "Full name of building administrator", with: @building.full_name_of_building_administrator
    fill_in "Full name technical contact", with: @building.full_name_technical_contact
    fill_in "Phone of building administrator", with: @building.phone_of_building_administrator
    fill_in "Technical contact email", with: @building.technical_contact_email
    fill_in "Technical contact phone", with: @building.technical_contact_phone
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "destroying a Building" do
    visit buildings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Building was successfully destroyed"
  end
end
