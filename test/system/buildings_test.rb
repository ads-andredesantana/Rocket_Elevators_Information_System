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

    fill_in "Buildingadmemail", with: @building.BuildingAdmEmail
    fill_in "Buildingadmfullname", with: @building.BuildingAdmFullName
    fill_in "Buildingadmphone", with: @building.BuildingAdmPhone
    fill_in "Buildingtechemail", with: @building.BuildingTechEmail
    fill_in "Buildingtechfullname", with: @building.BuildingTechFullName
    fill_in "Buildingtechphone", with: @building.BuildingTechPhone
    fill_in "Address", with: @building.address_id
    fill_in "Customer", with: @building.customer_id
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "updating a Building" do
    visit buildings_url
    click_on "Edit", match: :first

    fill_in "Buildingadmemail", with: @building.BuildingAdmEmail
    fill_in "Buildingadmfullname", with: @building.BuildingAdmFullName
    fill_in "Buildingadmphone", with: @building.BuildingAdmPhone
    fill_in "Buildingtechemail", with: @building.BuildingTechEmail
    fill_in "Buildingtechfullname", with: @building.BuildingTechFullName
    fill_in "Buildingtechphone", with: @building.BuildingTechPhone
    fill_in "Address", with: @building.address_id
    fill_in "Customer", with: @building.customer_id
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
