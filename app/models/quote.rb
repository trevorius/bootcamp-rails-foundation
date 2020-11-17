class Quote < ApplicationRecord
    has_many :admin_users
    has_many :customers, through: :admin_users 

    # #COMMENT IN OR OUT FOR ZENDESK 
    #after_create :create_new_quote_ticket

    # Creating the configuration
    def create_new_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end

        # Creating a new quote ticket on Zendesk
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{self.contact_full_name} from #{self.company_name}", 
            :comment => { 
                :value => "The contact #{self.contact_full_name} from company #{self.company_name} 
                    can be reached at email #{self.contact_email} and at phone number #{self.phone}. 
                    Building type selected is #{self.building_type} with product line #{self.product_grade}. 
                    Number of suggested elevator is #{self.no_of_elevators} and total price is #{self.total_cost}. \n
                    For More Information, refers to Quote ##{self.id}."
            }, 
            :requester => { 
                "name": self.contact_full_name, 
                "email": self.contact_email
            },
            :priority => "normal",
            :type => "task"
            )
    end
end

