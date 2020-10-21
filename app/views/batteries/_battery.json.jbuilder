json.extract! battery, :id, :building_id, :type, :status, :employee_id, :date_of_commissioning, :date_of_last_inspection, :certificate_of_operations, :information, :notes, :created_at, :updated_at
json.url battery_url(battery, format: :json)
