json.extract! building, :id, :customer_id, :address_id, :full_name_of_building_administrator, :email_of_building_administrator, :phone_of_building_administrator, :full_name_technical_contact, :technical_contact_email, :technical_contact_phone, :created_at, :updated_at
json.url building_url(building, format: :json)
