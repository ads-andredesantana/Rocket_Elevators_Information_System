json.extract! lead, :id, :full_name, :company_name, :phone, :project_name, :project_description, :department_in_charge_of_elevators, :message, :attached_file, :created_at, :updated_at
json.url lead_url(lead, format: :json)
