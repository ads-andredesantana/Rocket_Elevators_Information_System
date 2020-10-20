json.extract! customer, :id, :userId, :customer_creation_date, :company_name, :headquaters_address, :full_name_of_company_contact, :company_contact_phone, :email_of_company_contact, :company_description, :full_name_of_service_technical_authority, :technical_authority_phone, :technichal_manager_email_for_service, :created_at, :updated_at
json.url customer_url(customer, format: :json)
