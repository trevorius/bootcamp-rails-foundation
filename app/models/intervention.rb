class Intervention < ApplicationRecord
    belongs_to :building
    belongs_to :customer
    belongs_to :employee, optional: true
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true

    # COMMENT IN OUT FOR ZENDESK
    after_create :create_new_intervention_ticket
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.result ||= "Incomplete"
        self.status ||= "Pending"
    end

    def batterieId(intervention)
        if intervention.battery_id != nil
            return intervention.battery_id      
        end
        return ""
    end
    def columnId(intervention)
        if intervention.column_id != nil
            return intervention.column_id      
        end
        return ""
    end
    def elevatorId(intervention)
        if intervention.elevator_id != nil
            return intervention.elevator_id      
        end
        return ""
    end
    def employeeId(intervention)
        if intervention.employee_id != nil
            return intervention.employee_id      
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
                    4. Battery ID : #{batterieId(self)}
                    5. Column ID : #{columnId(self)}                    
                    6. Elevator : #{elevatorId(self)}
                    7. Employee assigned to the task : #{employeeId(self)}
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
