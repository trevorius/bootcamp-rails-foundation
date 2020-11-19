class Intervention < ApplicationRecord
    belongs_to :building
    belongs_to :customer
    belongs_to :employee, optional: true
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true

    # # COMMENT IN OUT FOR ZENDESK
    # after_create :create_new_intervention_ticket

    def batterieId()
        if self.battery_id != nil
            return self.battery_id      
        end
        return ""
    end
    def columnId()
        if self.column_id != nil
            return self.column_id      
        end
        return ""
    end
    def elevatorId()
        if self.elevator_id != nil
            return self.elevator_id      
        end
        return ""
    end
    def employeeId()
        if self.employee_id != nil
            return self.employee_id      
        end
        return ""
    end

    # Creating the configuration
    def create_new_intervention_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end

        # Creating a new intervention ticket on Zendesk
        ZendeskAPI::Ticket.create!(client, 
            :subject => "intervention Required for #{Customer.find(self.customer_id)[:company_name]} ", 
            :comment => { 
                :value => 
                    "
                    1. Requester : #{Employee.find(self.author)[:first_name]} #{Employee.find(self.author)[:last_name]}
                    2. Customer company name : #{Customer.find(self.customer_id)[:company_name]}
                    3. Building ID : #{self.building_id}
                    4. Battery ID : #{batterieId()}
                    5. Column ID : #{columnId()}                    
                    6. Elevator : #{elevatorId()}
                    7. Employee assigned to the task : #{employeeId()}
                    8. Description of the intervention :#{self.report}
                    "
            }, 
            :requester => { 
                "name": "#{Employee.find(self.author)[:first_name]} #{Employee.find(self.author)[:last_name]}", 
                "email": "#{Employee.find(self.author)[:email]}"
                 
            },
            :priority => "normal",
            :type => "problem"
            )
    end


end
