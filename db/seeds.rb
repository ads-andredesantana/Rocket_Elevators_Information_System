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
Employee.create(users_id:1, lastname:'Genest', firstname:'Nicolas', title_function:'CEO')
Employee.create(users_id:2, lastname:'Fortier',firstname:'Nadya', title_function:'Director')
Employee.create(users_id:3, lastname:'Chantal',firstname:'Martin', title_function:'Director Assistant')
Employee.create(users_id:4, lastname:'Houde',firstname:'Mathieu', title_function:'Captain')
Employee.create(users_id:5, lastname:'Boutin',firstname:'David', title_function:'Engineer')
Employee.create(users_id:6, lastname:'Lortie',firstname:'Mathieu', title_function:'Engineer')
Employee.create(users_id:7, lastname:'Carrier',firstname:'Thomas', title_function:'Engineer')
