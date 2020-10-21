json.extract! employee, :id, :users_id, :lastname, :firstname, :title_function, :created_at, :updated_at
json.url employee_url(employee, format: :json)
