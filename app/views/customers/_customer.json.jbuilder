json.extract! customer, :id, :users_id, :company_name, :address_id, :full_name_of_contact, :company_phone, :email_of_contact, :full_name_of_service_authority, :technical_authority_phone, :technical_authority_email, :created_at, :updated_at
json.url customer_url(customer, format: :json)
