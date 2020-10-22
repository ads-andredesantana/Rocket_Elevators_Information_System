# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

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

50.times {
    Lead.create(:full_name => Faker::Name.name, :company_name => Faker::Company.name, :email => Faker::Internet.email, :phone => Faker::PhoneNumber.phone_number, :project_name => Faker::Company.industry, :project_description => Faker::Company.type, :message => Faker::Construction.subcontract_category, :department_in_charge_of_elevators => Faker::Commerce.department, :created_at => Faker::Date.between(from: 3.years.ago, to: Date.today))
 }

# Define type of building
type = ["Residential", "Commercial", "Corporate", "Hybrid"]
service_quality = ["Standard", "Premium", "Excelium"]
entity = ["Building", "Customer"]

