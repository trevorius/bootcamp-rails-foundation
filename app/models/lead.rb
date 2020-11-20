class Lead < ApplicationRecord

    # COMMENT IN OUT FOR ZENDESK
    after_create :create_new_lead_ticket

    validate :file_size_under_ten_mb 

    def initialize(params = {})
        super        
        @file = params[:attached_file]
        if @file
            self.attached_file = @file.read
            self.attached_file_path = @file.original_filename
        end
    end

    NUM_BYES_IN_MEGABYTE = 1048576
    def file_size_under_ten_mb 
        if @file
            if (@file.size.to_f / NUM_BYES_IN_MEGABYTE) > 10
                errors.add(:attached_file, 'File size cannot be over 10 megabytes')
            end
        end
    end

    private
    def sanitize_filename(filename)
        # Get only the filename, not the whole path (for IE)
        return File.basename(filename)
    end


    # Creating the configuration
    def create_new_lead_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end

        # Creating a new lead ticket on Zendesk
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{self.contact_full_name} from #{self.company_name}", 
            :comment => { 
                :value => "The contact #{self.contact_full_name} 
                    from company #{self.company_name} 
                    can be reached at email  #{self.email} 
                    and at phone number #{self.phone}. 
                    #{self.department} has a project named #{self.project_name} which would require contribution from Rocket Elevators. 
                    \n\n
                    Project Description
                    #{self.project_description}\n\n
                    Attached Message: #{self.message}"
            }, 
            :requester => { 
                "name": self.contact_full_name, 
                "email": self.email 
            },
            :priority => "normal",
            :type => "question"
            )
    end
end