# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Employee.destroy_all

ngenest = User.create(:email => "nicolas.genest@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
nfortier = User.create(:email => "nadya.fortier@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
mchantal = User.create(:email => "martin.chantal@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
mhoude = User.create(:email => "mathieu.houde@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
dboutin = User.create(:email => "david.boutin@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
mlortie = User.create(:email => "mathieu.lortie@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")
tcarrier = User.create(:email => "thomas.carrier@codeboxx.biz", :password => "rocket", :password_confirmation => "rocket")

# Create employees
Employee.create(users_id:1, last_name:'Genest', first_name:'Nicolas', title:'CEO')
Employee.create(users_id:2, last_name:'Fortier',first_name:'Nadya', title:'Director')
Employee.create(users_id:3, last_name:'Chantal',first_name:'Martin', title:'Director Assistant')
Employee.create(users_id:4, last_name:'Houde',first_name:'Mathieu', title:'Captain')
Employee.create(users_id:5, last_name:'Boutin',first_name:'David', title:'Engineer')
Employee.create(users_id:6, last_name:'Lortie',first_name:'Mathieu', title:'Engineer')
Employee.create(users_id:7, last_name:'Carrier',first_name:'Thomas', title:'Engineer')