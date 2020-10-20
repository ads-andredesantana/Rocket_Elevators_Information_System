json.extract! employee, :id, :users, :first_name, :last_name, :title_function, :created_at, :updated_at
json.url employee_url(employee, format: :json)
