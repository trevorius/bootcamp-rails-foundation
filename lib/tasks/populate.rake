require 'pg'
require 'date'

require "faker"
require 'date'

namespace :populate do
    desc "launch all populate task"
    task tables: :environment do
        p "pop interventions"
        Rake::Task["populate:interventions"].invoke
        
    end

    desc "populate interventions table with fake data"
    task interventions: :environment do
        
        100.times do

            p "interventions:"

            start_date = Faker::Date.between(from: '1976-01-01', to: Date.today)
            p start_date
            end_date = Faker::Date.between(from: start_date, to: Date.today)
            p end_date
            result = "Complete"
            p result
            report = Faker::Lorem.sentence(word_count:rand(5..35))
            p report
            status = "Completed"
            p status
            author = rand(1..10)
            customer = rand(1..30)
            building_id = rand(Building.where(customer_id: customer).first[:id]..Building.where(customer_id: customer).last[:id])
            battery_id = rand(Battery.where(building_id: building_id).first[:id]..Battery.where(building_id: building_id).last[:id])
            column_id = rand(Column.where(battery_id: battery_id).first[:id]..Column.where(battery_id: battery_id).last[:id])
            elevator_id =rand(Elevator.where(column_id: column_id).first[:id]..Elevator.where(column_id: column_id).last[:id])
            employee_id = rand(1..Employee.all.count)


           Intervention.create(
                start_date: start_date,
                end_date: end_date,
                result: result,
                report: report,
                status: status,
                created_at: start_date,
                updated_at: end_date,
                author: author,
                building_id:building_id,
                employee_id: employee_id,
                battery_id: battery_id,
                column_id: column_id,
                elevator_id: elevator_id

            )
            
           pp Intervention.last

        end
    end
end