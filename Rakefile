# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

require "faker"
require "rubocop-faker"
desc 'exporttest'
task :exporttest => :environment do

    puts "\n--------rake task start--------\n"
    # conn = PG::Connection.open(dbname: ENV["second_db"] )
    # conn = PG::Connection.open(host: ENV["DB2_Host"], user: ENV["DB2_USERNAME"], password: ENV["DB2_PASSWORD"], dbname: ENV["second_db"])

    conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "codeboxx", password: "Codeboxx1!", dbname: "pg_Trevor_Kitchen_team2")


    conn.exec("TRUNCATE \"factinterventions\" RESTART IDENTITY")
    
    building_count = Building.count
    not_technician_count = Employee.where.not(title: 'technician').count
    employee_count = Employee.count
    battery_count = Battery.count

    table = Battery.all
    

    200.times do
        report = Faker::Lorem.sentence(word_count:rand(5..35))
        report_rand = rand(0..1)
        if report_rand == 1
            report = ""
        end
        battery_id_rand = rand(1..battery_count)
        battery = table.where(id: battery_id_rand)
        building_id = table.find(battery_id_rand).building_id
        employee_id = table.find(battery_id_rand).employee_id
        fake_date1 = Faker::Date.between(from: '2010-10-01', to: '2020-09-30')
        fake_date1_string = fake_date1.to_s #start of intervention
        fake_date1_end_rand = rand(1..20)
        fake_date1_end = fake_date1 + fake_date1_end_rand 
        fake_date1_end_string = (fake_date1_end).to_s #end of intervention
        puts fake_date1_string
        puts fake_date1_end
        fake_date2 = nil
        fake_date2_existing = rand(0..1)
        fake_date2 = fake_date1_end_string 
            
        intervention_item = rand(0..2) #0=elevator, 1=column, 2=battery
        #intervention_item = 0 #a effacer
        battery_mysql = Battery.find(battery_id_rand)
        if intervention_item == 0 #ELEVATOR
            columns_mysql = Column.where(battery_id: battery_id_rand)
            columns_count = columns_mysql.count
            #puts columns_count
            selected_column = rand(1..columns_count)
            the_count = 1
            column_id_selected = 0
            columns_mysql.each do |c|
                if the_count == selected_column
                    column_id_selected = c.id    
                end
                the_count += 1
            end
            
            elevators_mysql = Elevator.where(column_id: column_id_selected)
            elevators_count = elevators_mysql.count
            
            selected_elevator = rand(1..elevators_count)
            the_count2 = 1
            elevator_id_selected = 0
            elevators_mysql.each do |c|
                if the_count2 == selected_elevator
                    elevator_id_selected = c.id
                       
                    if fake_date2 == nil
                        result = "Incomplete"
                        status_array = ["Pending","InProgress","Interrupted", "Resumed"]
                        status = status_array[rand(0..3)]
                        puts status
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"elevator_id\", \"start_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{elevator_id_selected}','#{fake_date1}','#{result}','#{status}','#{report}')")
                    else
                        result_rand = rand(0..6)
                        if result_rand > 0
                            result = "Success"
                        else
                            result = "Failure"
                        end
                        status = "Complete"
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"elevator_id\", \"start_date_intervention\", \"end_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{elevator_id_selected}','#{fake_date1}', '#{fake_date2}','#{result}','#{status}','#{report}')")
                    end
                end
                the_count2 += 1
            end
            
        elsif intervention_item == 1 #COLUMN
            columns_mysql = Column.where(battery_id: battery_id_rand)
            columns_count = columns_mysql.count
            #puts columns_count
            selected_column = rand(1..columns_count)
            the_count = 1
            column_id_selected = 0
            columns_mysql.each do |c|
                if the_count == selected_column
                    column_id_selected = c.id
                    
                    if fake_date2 == nil
                        result = "Incomplete"
                        status_array = ["Pending","InProgress","Interrupted", "Resumed"]
                        status = status_array[rand(0..3)]
                        puts status
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"column_id\", \"start_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{column_id_selected}','#{fake_date1}','#{result}','#{status}','#{report}')")
                    else
                        result_rand = rand(0..6)
                        if result_rand > 0
                            result = "Success"
                        else
                            result = "Failure"
                        end
                        status = "Complete"
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"column_id\", \"start_date_intervention\", \"end_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{column_id_selected}','#{fake_date1}', '#{fake_date2}','#{result}','#{status}','#{report}')")
                    end
                end
                the_count += 1
            end
        elsif intervention_item == 2 #BATTERY
            
            if fake_date2 == nil
                result = "Incomplete"
                status_array = ["Pending","InProgress","Interrupted", "Resumed"]
                status = status_array[rand(0..3)]
                puts status
                conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"battery_id\", \"start_date_intervention\", \"result\", \"status\", \"report\") VALUES ('#{employee_id}', '#{building_id}', '#{battery_id_rand}','#{fake_date1}','#{result}','#{status}','#{report}')")
            else
                result_rand = rand(0..6)
                if result_rand > 0
                    result = "Success"
                else
                    result = "Failure"
                end
                status = "Complete"
                conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"battery_id\", \"start_date_intervention\", \"end_date_intervention\", \"result\", \"status\", \"report\") VALUES ('#{employee_id}', '#{building_id}', '#{battery_id_rand}','#{fake_date1}', '#{fake_date2}','#{result}','#{status}','#{report}')")
            end
        end
    end
    15.times do
        report = Faker::Lorem.sentence(word_count:rand(5..35))
        report_rand = rand(0..1)
        if report_rand == 1
            report = ""
        end
        battery_id_rand = rand(1..battery_count)
        battery = table.where(id: battery_id_rand)
        building_id = table.find(battery_id_rand).building_id
        employee_id = table.find(battery_id_rand).employee_id
        fake_date1 = Faker::Date.between(from: '2020-10-01', to: Date.today)
        fake_date1_string = fake_date1.to_s #start of intervention
        fake_date1_end_rand = rand(1..20)
        fake_date1_end = fake_date1 + fake_date1_end_rand 
        fake_date1_end_string = (fake_date1_end).to_s #end of intervention
        puts fake_date1_string
        puts fake_date1_end
        fake_date2 = nil
        fake_date2_existing = rand(0..1)
        if fake_date2_existing == 1
            fake_date2 = fake_date1_end_string 
            #fake_date2 = Faker::Date.between(from: fake_date1_string, to: '2020-11-13')
        #puts fake_date2
        else
            if fake_date1_end < Date.today - 31
                fake_date2 = fake_date1_end_string 
            end
        end

        intervention_item = rand(0..2) #0=elevator, 1=column, 2=battery
        #intervention_item = 0 #a effacer
        battery_mysql = Battery.find(battery_id_rand)
        if intervention_item == 0 #ELEVATOR
            columns_mysql = Column.where(battery_id: battery_id_rand)
            columns_count = columns_mysql.count
            #puts columns_count
            selected_column = rand(1..columns_count)
            the_count = 1
            column_id_selected = 0
            columns_mysql.each do |c|
                if the_count == selected_column
                    column_id_selected = c.id    
                end
                the_count += 1
            end
            
            elevators_mysql = Elevator.where(column_id: column_id_selected)
            elevators_count = elevators_mysql.count
            
            selected_elevator = rand(1..elevators_count)
            the_count2 = 1
            elevator_id_selected = 0
            elevators_mysql.each do |c|
                if the_count2 == selected_elevator
                    elevator_id_selected = c.id
                    c.status = "Intervention"
                    c.save   
                    if fake_date2 == nil
                        result = "Incomplete"
                        status_array = ["Pending","InProgress","Interrupted", "Resumed"]
                        status = status_array[rand(0..3)]
                        puts status
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"elevator_id\", \"start_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{elevator_id_selected}','#{fake_date1}','#{result}','#{status}','#{report}')")
                    else
                        result_rand = rand(0..6)
                        if result_rand > 0
                            result = "Success"
                        else
                            result = "Failure"
                        end
                        status = "Complete"
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"elevator_id\", \"start_date_intervention\", \"end_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{elevator_id_selected}','#{fake_date1}', '#{fake_date2}','#{result}','#{status}','#{report}')")
                    end
                end
                the_count2 += 1
            end
            
        elsif intervention_item == 1 #COLUMN
            columns_mysql = Column.where(battery_id: battery_id_rand)
            columns_count = columns_mysql.count
            #puts columns_count
            selected_column = rand(1..columns_count)
            the_count = 1
            column_id_selected = 0
            columns_mysql.each do |c|
                if the_count == selected_column
                    column_id_selected = c.id
                    c.status = "Intervention"
                    c.save
                    if fake_date2 == nil
                        result = "Incomplete"
                        status_array = ["Pending","InProgress","Interrupted", "Resumed"]
                        status = status_array[rand(0..3)]
                        puts status
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"column_id\", \"start_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{column_id_selected}','#{fake_date1}','#{result}','#{status}','#{report}')")
                    else
                        result_rand = rand(0..6)
                        if result_rand > 0
                            result = "Success"
                        else
                            result = "Failure"
                        end
                        status = "Complete"
                        conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"column_id\", \"start_date_intervention\", \"end_date_intervention\", \"result\", \"status\", \"report\" ) VALUES ('#{employee_id}', '#{building_id}', '#{column_id_selected}','#{fake_date1}', '#{fake_date2}','#{result}','#{status}','#{report}')")
                    end
                end
                the_count += 1
            end
        elsif intervention_item == 2 #BATTERY
            battery_mysql.status = "Intervention"
            battery_mysql.save
            if fake_date2 == nil
                result = "Incomplete"
                status_array = ["Pending","InProgress","Interrupted", "Resumed"]
                status = status_array[rand(0..3)]
                puts status
                conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"battery_id\", \"start_date_intervention\", \"result\", \"status\", \"report\") VALUES ('#{employee_id}', '#{building_id}', '#{battery_id_rand}','#{fake_date1}','#{result}','#{status}','#{report}')")
            else
                result_rand = rand(0..6)
                if result_rand > 0
                    result = "Success"
                else
                    result = "Failure"
                end
                status = "Complete"
                conn.exec("INSERT INTO \"factinterventions\" (\"employee_id\", \"building_id\", \"battery_id\", \"start_date_intervention\", \"end_date_intervention\", \"result\", \"status\", \"report\") VALUES ('#{employee_id}', '#{building_id}', '#{battery_id_rand}','#{fake_date1}', '#{fake_date2}','#{result}','#{status}','#{report}')")
            end
        end
    end
    conn.finish()
    puts "\n--------rake task end--------\n"
end