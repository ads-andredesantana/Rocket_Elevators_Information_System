require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Activehours", with: @quote.activehours
    fill_in "Buildingtype", with: @quote.buildingtype
    fill_in "Businessname", with: @quote.businessname
    fill_in "Elevatorprice", with: @quote.elevatorprice
    fill_in "Email", with: @quote.email
    fill_in "Fullname", with: @quote.fullName
    fill_in "Installfee", with: @quote.installfee
    fill_in "Nbapartment", with: @quote.nbapartment
    fill_in "Nbbasement", with: @quote.nbbasement
    fill_in "Nbbusiness", with: @quote.nbbusiness
    fill_in "Nbcompanies", with: @quote.nbcompanies
    fill_in "Nbelevator", with: @quote.nbelevator
    fill_in "Nbfloor", with: @quote.nbfloor
    fill_in "Nboccupant", with: @quote.nboccupant
    fill_in "Nbparking", with: @quote.nbparking
    fill_in "Nbshaft", with: @quote.nbshaft
    fill_in "Phone", with: @quote.phone
    fill_in "Projectname", with: @quote.projectname
    fill_in "Quality", with: @quote.quality
    fill_in "Subtotal", with: @quote.subtotal
    fill_in "Total", with: @quote.total
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Activehours", with: @quote.activehours
    fill_in "Buildingtype", with: @quote.buildingtype
    fill_in "Businessname", with: @quote.businessname
    fill_in "Elevatorprice", with: @quote.elevatorprice
    fill_in "Email", with: @quote.email
    fill_in "Fullname", with: @quote.fullName
    fill_in "Installfee", with: @quote.installfee
    fill_in "Nbapartment", with: @quote.nbapartment
    fill_in "Nbbasement", with: @quote.nbbasement
    fill_in "Nbbusiness", with: @quote.nbbusiness
    fill_in "Nbcompanies", with: @quote.nbcompanies
    fill_in "Nbelevator", with: @quote.nbelevator
    fill_in "Nbfloor", with: @quote.nbfloor
    fill_in "Nboccupant", with: @quote.nboccupant
    fill_in "Nbparking", with: @quote.nbparking
    fill_in "Nbshaft", with: @quote.nbshaft
    fill_in "Phone", with: @quote.phone
    fill_in "Projectname", with: @quote.projectname
    fill_in "Quality", with: @quote.quality
    fill_in "Subtotal", with: @quote.subtotal
    fill_in "Total", with: @quote.total
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
