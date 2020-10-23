require 'pg'
require 'faker'

task dw_table: :environment do

   #LOCAL CONNECTION
    # connection = PG::Connection.open(
    #     host: "localhost",
    #     port: 5432,
    #     dbname:"myapp_stats_development",
    #     user:"postgres",
    #     password:"codeboxx")

    # THE REAL DEAL
    connection = PG::Connection.open(
        host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", 
        port: 5432, 
        dbname: "AndreDeSantana", 
        user: "codeboxx", 
        password: "Codeboxx1!")

# Make the tables
    connection.exec("
        CREATE TABLE fact_quotes(
            quote_id INT NOT NULL,
            creation_date DATE NOT NULL,
            company_name VARCHAR (150) NOT NULL,
            email VARCHAR (150) NOT NULL,
            nb_elevators INT NOT NULL);
        CREATE TABLE fact_contact(
            contact_id INT NOT NULL,
            creation_date DATE  NOT NULL,
            company_name VARCHAR (150) NOT NULL,
            email VARCHAR (150) NOT NULL,
            project_name VARCHAR (150) NOT NULL);
        CREATE TABLE fact_elevator(
            serial_number VARCHAR (150) NOT NULL,
            commissioning_date DATE NOT NULL,
            building_id INT NOT NULL,
            customer_id INT NOT NULL,
            city VARCHAR (150) NOT NULL);
        CREATE TABLE dim_customers(
            creation_date DATE NOT NULL,
            company_name VARCHAR (150) NOT NULL,
            company_contact_name VARCHAR (150) NOT NULL,
            company_contact_email VARCHAR (150)  NOT NULL,
            number_elevators INT NOT NULL,
            customer_city VARCHAR (150) NOT NULL);
        CREATE TABLE FactIntervention(
            id SERIAL NOT NULL,
            employee_id INT NOT NULL,
            building_id INT NOT NULL,
            battery_id INT,
            column_id INT,
            elevator_id INT,
            start_date DATE  NOT NULL,
            end_date DATE,
            result VARCHAR (150) NOT NULL,
            report VARCHAR (150),
            status VARCHAR (150) NOT NULL);
    ")
end

task fill_tables: :environment do
    # Populate the tables

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

    puts "EMPTYING TABLES"
    connection.exec("TRUNCATE fact_quotes RESTART IDENTITY")
    connection.exec("TRUNCATE fact_elevator RESTART IDENTITY")
    connection.exec("TRUNCATE fact_contact RESTART IDENTITY")
    connection.exec("TRUNCATE dim_customers RESTART IDENTITY")
    connection.exec("TRUNCATE FactIntervention RESTART IDENTITY")

    puts "FILLING TABLES UP"
    Lead.all.each do |lead|
        connection.exec("INSERT INTO \"fact_contact\" (contact_id, creation_date, company_name, email, project_name) 
        VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.company_name}', '#{lead.email}', '#{lead.project_name}')")          
        end

    Quote.all.each do |quote|
        connection.exec("INSERT INTO \"fact_quotes\" (quote_id, creation_date, company_name, email, nb_elevators) 
        VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.company}', '#{quote.email}', #{quote.estimate_number_of_cages})")          
        end

    Elevator.all.each do |elevator|
        connection.exec("INSERT INTO \"fact_elevator\" (serial_number, commissioning_date, building_id, customer_id, city) 
        VALUES ('#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.column.battery.building_id}', '#{elevator.column.battery.building.customer.user_id}', '#{elevator.column.battery.building.address.city}')")          
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
        connection.exec("INSERT INTO \"dim_customers\" (creation_date, company_name, company_contact_name, company_contact_email, number_elevators, customer_city) 
        VALUES ('#{customer.created_at}', '#{customer.company_name}', '#{customer.tech_authority_full_name}', '#{customer.tech_authority_email}', '#{numEl}', '#{customer.address.city}')")          
    end

end