# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
const addresses = require('./rrad/addresses-us-500.json').addresses
const randomAddress = addresses[Math.floor(Math.random() * addresses.length)]


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

# Define type of building
building_type = ["Residential", "Commercial", "Corporate", "Hybrid"]
service_quality = ["Standard", "Premium", "Excelium"]

const rrad = require('rrad')
const randomAddress = rrad.addresses[Math.floor(Math.random() * rrad.addresses.length)] 
Create addresses
type_of_address = ["Billing", "Shipping", "Home", "Business"]
status_type = ["Active", "Inactive"]
entity_type = ["Building", "Customer"]

csv_text = File.read(Rails.root.join('db', 'addresses-us-500.json'))
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  Address.create(:type_of_address => type_of_address.sample, 
  :status => status_type.sample, :entity => entity_type.sample, 
  :number_street => row["address"], 
  :suite_apartment => Faker::Address.secondary_address, 
  :city => row["city"], :postal_code=> row["zip"], 
  :Country => row["USA"], 
  :Notes => Faker::Types.rb_string)
end

p "Create #{Address.count} addresses"





customer_id_for_building = [*1..20]
address_id_for_building = [*21..40]

# Create customers
user_id_for_customer = [*28..47]
address_id_for_customer = [*1..20]

20.times {
    Customer.create(:user_id => user_id_for_customer.delete(user_id_for_customer.sample), :company_name => Faker::Company.name, :address_id => address_id_for_customer.delete(address_id_for_customer.sample), :full_name_of_contact => Faker::Name.name, :company_phone => Faker::PhoneNumber.phone_number, :email_of_contact => Faker::Internet.email, :full_name_of_service_authority => Faker::Name.name, :technical_authority_phone => Faker::PhoneNumber.phone_number, :technical_authority_email => Faker::Internet.email)
}

p "Create #{Customer.count} customers"
 
20.times {
    Building.create(:customer_id => customer_id_for_building.delete(customer_id_for_building.sample), :address_id => address_id_for_building.delete(address_id_for_building.sample), :BuildingAdmFullName => Faker::Name.name, :BuildingAdmEmail => Faker::Internet.email, :BuildingAdmPhone => Faker::PhoneNumber.phone_number, :BuildingTechFullName => Faker::Name.name, :BuildingTechEmail => Faker::Internet.email, :BuildingTechPhone => Faker::PhoneNumber.phone_number)
}

p "Create #{Building.count} buildings"

# Create buildings  details
building_id_for_detail = [*1..20]

20.times {
    BuildingDetail.create(:building_id => building_id_for_detail.delete(building_id_for_detail.sample), :key => Faker::Types.rb_string, :value => Faker::Types.rb_string)
}

p "Create #{BuildingDetail.count} buildings details"



 #quotes
100.times {
    Quote.create(:fullName => Faker::Name.name, :email => Faker::Internet.email, :phone => Faker::PhoneNumber.phone_number, :businessname => Faker::Company.name, :projectname => Faker::Company.industry, :quality => service_quality.sample, :buildingtype => building_type.sample, :nbapartment => Faker::Number.digit, :nbfloor => Faker::Number.digit, :nbbasement => Faker::Number.digit, :nbbusiness => Faker::Number.digit, :nbparking => Faker::Number.digit, :nbshaft => Faker::Number.digit, :nboccupant => Faker::Number.digit, :nbcompanies => Faker::Number.digit, :activehours => Faker::Number.digit, :nbelevator => Faker::Number.digit, :elevatorprice => Faker::Commerce.price, :subtotal => Faker::Commerce.price, :installfee => Faker::Commerce.price, :total => Faker::Commerce.price, :created_at => Faker::Date.between(from: 2.years.ago, to: Date.today))
}
p "Create #{Quote.count} quotes"

