require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { company_contact_phone: @customer.company_contact_phone, company_description: @customer.company_description, company_name: @customer.company_name, customer_creation_date: @customer.customer_creation_date, email_of_company_contact: @customer.email_of_company_contact, full_name_of_company_contact: @customer.full_name_of_company_contact, full_name_of_service_technical_authority: @customer.full_name_of_service_technical_authority, headquaters_address: @customer.headquaters_address, technical_authority_phone: @customer.technical_authority_phone, technichal_manager_email_for_service: @customer.technichal_manager_email_for_service, userId: @customer.userId } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { company_contact_phone: @customer.company_contact_phone, company_description: @customer.company_description, company_name: @customer.company_name, customer_creation_date: @customer.customer_creation_date, email_of_company_contact: @customer.email_of_company_contact, full_name_of_company_contact: @customer.full_name_of_company_contact, full_name_of_service_technical_authority: @customer.full_name_of_service_technical_authority, headquaters_address: @customer.headquaters_address, technical_authority_phone: @customer.technical_authority_phone, technichal_manager_email_for_service: @customer.technichal_manager_email_for_service, userId: @customer.userId } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end