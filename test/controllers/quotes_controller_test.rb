require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { activehours: @quote.activehours, buildingtype: @quote.buildingtype, businessname: @quote.businessname, elevatorprice: @quote.elevatorprice, email: @quote.email, fullName: @quote.fullName, installfee: @quote.installfee, nbapartment: @quote.nbapartment, nbbasement: @quote.nbbasement, nbbusiness: @quote.nbbusiness, nbcompanies: @quote.nbcompanies, nbelevator: @quote.nbelevator, nbfloor: @quote.nbfloor, nboccupant: @quote.nboccupant, nbparking: @quote.nbparking, nbshaft: @quote.nbshaft, phone: @quote.phone, projectname: @quote.projectname, quality: @quote.quality, subtotal: @quote.subtotal, total: @quote.total } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { activehours: @quote.activehours, buildingtype: @quote.buildingtype, businessname: @quote.businessname, elevatorprice: @quote.elevatorprice, email: @quote.email, fullName: @quote.fullName, installfee: @quote.installfee, nbapartment: @quote.nbapartment, nbbasement: @quote.nbbasement, nbbusiness: @quote.nbbusiness, nbcompanies: @quote.nbcompanies, nbelevator: @quote.nbelevator, nbfloor: @quote.nbfloor, nboccupant: @quote.nboccupant, nbparking: @quote.nbparking, nbshaft: @quote.nbshaft, phone: @quote.phone, projectname: @quote.projectname, quality: @quote.quality, subtotal: @quote.subtotal, total: @quote.total } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
