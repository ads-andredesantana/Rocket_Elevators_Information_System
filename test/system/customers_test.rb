require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Address", with: @customer.address_id
    fill_in "Company name", with: @customer.company_name
    fill_in "Company phone", with: @customer.company_phone
    fill_in "Email of contact", with: @customer.email_of_contact
    fill_in "Full name of contact", with: @customer.full_name_of_contact
    fill_in "Full name of service authority", with: @customer.full_name_of_service_authority
    fill_in "Technical authority email", with: @customer.technical_authority_email
    fill_in "Technical authority phone", with: @customer.technical_authority_phone
    fill_in "Users", with: @customer.users_id
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @customer.address_id
    fill_in "Company name", with: @customer.company_name
    fill_in "Company phone", with: @customer.company_phone
    fill_in "Email of contact", with: @customer.email_of_contact
    fill_in "Full name of contact", with: @customer.full_name_of_contact
    fill_in "Full name of service authority", with: @customer.full_name_of_service_authority
    fill_in "Technical authority email", with: @customer.technical_authority_email
    fill_in "Technical authority phone", with: @customer.technical_authority_phone
    fill_in "Users", with: @customer.users_id
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
