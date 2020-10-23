User.destroy_all
Employee.destroy_all
# Create the needed users
ngenest = User.create(:email => "nicolas.genest@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)
nfortier = User.create(:email => "nadya.fortier@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)
mchantal = User.create(:email => "martin.chantal@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)
mhoude = User.create(:email => "mathieu.houde@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)
dboutin = User.create(:email => "david.boutin@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)
mlortie = User.create(:email => "mathieu.lortie@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)
tcarrier = User.create(:email => "thomas.carrier@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket", :admin => true)

# Create some employees
Employee.create(:user_id => ngenest.id, :lastname => "Genest", :firstname => "Nicolas", :title_function => "CEO")
Employee.create(:user_id => nfortier.id, :lastname => "Fortier", :firstname => "Nadya", :title_function => "Director")
Employee.create(:user_id => mchantal.id, :lastname => "Chantal", :firstname => "Martin", :title_function => "Director Assistant")
Employee.create(:user_id => mhoude.id, :lastname => "Houde", :firstname => "Mathieu", :title_function => "Captain")
Employee.create(:user_id => dboutin.id, :lastname => "Boutin", :firstname => "David", :title_function => "Engineer")
Employee.create(:user_id => mlortie.id, :lastname => "Lortie", :firstname => "Mathieu", :title_function => "Engineer")
Employee.create(:user_id => tcarrier.id, :lastname => "Carrier", :firstname => "Thomas", :title_function => "Engineer")
#create employees
20.times {
    user = User.create(:email => Faker::Internet.email, :password => "rocket", :password_confirmation => "rocket")
    Employee.create(:user_id => user.id, :lastname => Faker::Name.last_name, :firstname => Faker::Name.last_name, :title_function=> Faker::Construction.role)
}

# Create random users for customers
20.times {
    User.create(:email => Faker::Internet.email, :password => "rocket", :password_confirmation => "rocket")
}

p "Created #{User.count} users"
p "Created #{Employee.count} employees"



50.times {
    Lead.create(:full_name => Faker::Name.name, :company_name => Faker::Company.name, :email => Faker::Internet.email, :phone => Faker::PhoneNumber.phone_number, :project_name => Faker::Company.industry, :project_description => Faker::Company.type, :message => Faker::Construction.subcontract_category, :department_in_charge_of_elevators => Faker::Commerce.department, :created_at => Faker::Date.between(from: 3.years.ago, to: Date.today))
 }


#Create addresses
type_of_address = ["Billing", "Shipping", "Home", "Business"]
status_type= ["Active", "Inactive"]
entity_type = ["Building", "Customer"]

csv_text = File.read(Rails.root.join('db', 'us-500.csv'))
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  Address.create(:type_of_address => type_of_address.sample, 
  :status => status_type.sample, 
  :entity => entity_type.sample, 
  :number_street => row["address"], 
  :suite_apartment => Faker::Address.secondary_address, 
  :city => row["city"], 
  :postal_code => row["postalCode"], 
  :country => row["USA"], 
  :notes => Faker::Types.rb_string)
end

p "Create #{Address.count} addresses"


customer_id_for_building = [*1..20]
address_id_for_building = [*21..40]

# Create customers
user_id_for_customer = [*28..47]
address_id_for_customer = [*1..20]

20.times {
    Customer.create(:user_id => user_id_for_customer.delete(user_id_for_customer.sample), 
    :company_name => Faker::Company.name, 
    :address_id => address_id_for_customer.delete(address_id_for_customer.sample), 
    :full_name_of_contact => Faker::Name.name, 
    :company_phone => Faker::PhoneNumber.phone_number, 
    :email_of_contact => Faker::Internet.email, 
    :full_name_of_service_authority => Faker::Name.name, 
    :technical_authority_phone => Faker::PhoneNumber.phone_number, 
    :technical_authority_email => Faker::Internet.email)
}

p "Create #{Customer.count} customers"

# Define type of building
building_type = ["Residential", "Commercial", "Corporate", "Hybrid"]
service_quality = ["Standard", "Premium", "Excelium"]

20.times {
    Building.create(:customer_id => customer_id_for_building.delete(customer_id_for_building.sample), 
    :address_id => address_id_for_building.delete(address_id_for_building.sample), 
    :full_name_of_building_administrator => Faker::Name.name, 
    :email_of_building_administrator => Faker::Internet.email, 
    :phone_of_building_administrator => Faker::PhoneNumber.phone_number, 
    :full_name_technical_contact => Faker::Name.name, 
    :technical_contact_email => Faker::Internet.email, 
    :technical_contact_phone => Faker::PhoneNumber.phone_number)
}

p "Create #{Building.count} buildings"

# Create buildings  details
building_id_for_detail = [*1..20]

20.times {
    BuildingDetail.create(
    :building_id => building_id_for_detail.delete(building_id_for_detail.sample), 
    :information_key => Faker::Types.rb_string, :value => Faker::Types.rb_string)
}

p "Create #{BuildingDetail.count} buildings details"



 #quotes
100.times {
    Quote.create(
        :fullName => Faker::Name.name, 
        :email => Faker::Internet.email, 
        :phone => Faker::PhoneNumber.phone_number, 
        :businessname => Faker::Company.name, 
        :projectname => Faker::Company.industry, 
        :quality => service_quality.sample, 
        :buildingtype => building_type.sample, 
        :nbapartment => Faker::Number.digit, 
        :nbfloor => Faker::Number.digit, 
        :nbbasement => Faker::Number.digit, 
        :nbbusiness => Faker::Number.digit, 
        :nbparking => Faker::Number.digit, 
        :nbshaft => Faker::Number.digit, 
        :nboccupant => Faker::Number.digit, 
        :nbcompanies => Faker::Number.digit,
        :activehours => Faker::Number.digit, 
        :nbelevator => Faker::Number.digit, 
        :elevatorprice => Faker::Commerce.price, 
        :subtotal => Faker::Commerce.price, 
        :installfee => Faker::Commerce.price,
        :total => Faker::Commerce.price,
        :created_at => Faker::Date.between(from: 3.years.ago, to: Date.today))
}
p "Create #{Quote.count} quotes"


# Create battery
building_id_for_battery = [*1..20]
employee_id_for_battery = [*1..20]

20.times {
    Battery.create(
    :building_id => building_id_for_battery.delete(building_id_for_battery.sample), 
    :battery_type => building_type.sample, 
    :status => status_type.sample, 
    :employee_id => employee_id_for_battery.delete(employee_id_for_battery.sample), 
    :date_of_commissioning => Faker::Date.between(from: 3.years.ago, to: Date.today), 
    :date_of_last_inspection => Faker::Date.between(from: 3.years.ago, to: Date.today), 
    :certificate_of_operations => Faker::Code.isbn)
}

p "Create #{Battery.count} batteries"

# Create columns
battery_id_for_column = [*1..20]

20.times {
    Column.create!(
    :battery_id => battery_id_for_column.delete(battery_id_for_column.sample), 
    :column_type => building_type.sample, 
    :number_of_floors_served => Faker::Number.number(digits: 2), 
    :status => status_type.sample, 
    :information => Faker::Types.rb_string, 
    :notes => Faker::Types.rb_string)
}

p "Create #{Column.count} columns"

# Create elevators
column_id_for_elevator = [*1..80]

# 200.times 
#     Elevator.create!(
#     column_id: column_id_for_elevator.sample, 
#     serial_number: Faker::Code.isbn,
#     model: service_quality.sample, 
#     elevator_type: building_type.sample,
#     status: status_type.sample,
#     date_of_commissioning: Faker::Time.between(from: 3.years.ago, to: Time.today), 
#     date_of_last_inspection: Faker::Time.between(from: 3.years.ago, to: Time.today), 
#     certificate_of_inspection: Faker::Code.isbn, 
#     information: Faker::Types.rb_string, 
#     notes: Faker::Types.rb_string
# )

# # p "Create #{Elevator.count} elevators"