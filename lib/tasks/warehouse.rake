require 'pg'
require 'faker'

# Creating a task that will be activated with the rake
task dw_table: :environment do


   #LOCAL CONNECTION - In case you wanna try on your local environment.
    # connection = PG::Connection.open(
    #     host: "localhost",
    #     port: 5432,
    #     dbname:"myapp_stats_development",
    #     user:"postgres",
    #     password:"codeboxx")

    # Informations nécessaires pour la connection à la base de données postgres en production
    connection = PG::Connection.open(
        host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", 
        port: 5432, 
        dbname: "AndreDeSantana", 
        user: "codeboxx", 
        password: "Codeboxx1!")

# Creating the tables
    connection.exec("
        CREATE TABLE dim_customers(
            creation_date DATE NOT NULL,
            CompanyName VARCHAR (150) NOT NULL,
            ContactFullname VARCHAR (150) NOT NULL,
            ContactEmail VARCHAR (150)  NOT NULL,
            NbElevator INT NOT NULL,
            City VARCHAR (150) NOT NULL);

        CREATE TABLE fact_contact(
            ContactId INT NOT NULL,
            CreationDate DATE  NOT NULL,
            CompanyName VARCHAR (150) NOT NULL,
            Email VARCHAR (150) NOT NULL,
            ProjectName VARCHAR (150) NOT NULL);
            
        CREATE TABLE fact_elevator(
            SerialNumber VARCHAR (150) NOT NULL,
            CommissioningDate DATE NOT NULL,
            BuildingId INT NOT NULL,
            CustomerId INT NOT NULL,
            City VARCHAR (150) NOT NULL);

        CREATE TABLE fact_quotes(
            QuoteId INT NOT NULL,
            CreationDate DATE NOT NULL,
            CompanyName VARCHAR (150) NOT NULL,
            Email VARCHAR (150) NOT NULL,
            NbElevator INT NOT NULL);     
    ")
end

# Creating a task to add the information to the tables
task fill_tables: :environment do

    # connection = PG::Connection.open(
    #     host: "localhost", 
    #     port: 5432,
    #     dbname:"myapp_stats_development",
    #     user:"postgres", 
    #     password:"codeboxx")


    connection = PG::Connection.open(
        host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", 
        port: 5432, 
        dbname: "AndreDeSantana", 
        user: "codeboxx", 
        password: "Codeboxx1!")

    # Cleaning the tables
    puts "EMPTYING TABLES"
    connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
    connection.exec("TRUNCATE fact_elevators RESTART IDENTITY")
    connection.exec("TRUNCATE fact_contacts RESTART IDENTITY")
    connection.exec("TRUNCATE dim_customers RESTART IDENTITY")


    # Filling the tables 
    puts "FILLING TABLES UP"
    Lead.all.each do |lead|
        connection.exec("INSERT INTO \"fact_contacts\" (ContactId, CreationDat, CompanyName, Email, ProjectName) 
        VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.company_name}', '#{lead.email}', '#{lead.project_name}')")          
        end

    Quote.all.each do |quote|
        connection.exec("INSERT INTO \"fact_quotes\" (QuoteId, CreationDate, CompanyName, Email, NbElevator) 
        VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.businessname}', '#{quote.email}', #{quote.nbelevator})")          
        end

    Elevator.all.each do |elevator|
        connection.exec("INSERT INTO \"fact_elevators\" (SerialNumber, CommissioningDate, BuildingId, CustomerId, City) 
        VALUES ('#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.column_type.battery_type.building_id}', '#{elevator.column.battery_type.building_id.customer.user_id}', '#{elevator.column.battery_type.building_id.type_of_address.city}')")          
        end

    Customer.all.each do |customer|
        numEl = 0
        customer.buildings.all.each do |building|
            building.batteries.all.each do |battery|
                battery.columns.all.each do |column|
                    column.elevators.all.each do |elevator|
                        numEl = numEl + 1
                    end
                end
            end
        end            
        connection.exec("INSERT INTO \"dim_customers\" (CreationDate, CompanyName, ContactFullname, ContactEmail, NbElevator, City) 
        VALUES ('#{customer.created_at}', '#{customer.company_name}', '#{customer.full_name_of_service_authority}', '#{customer.technical_authority_email}', '#{numEl}', '#{customer.address_id}')")          
    end

end