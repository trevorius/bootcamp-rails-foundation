# require './lib/tasks/messenger.rb'
require 'twilio-ruby'
require 'slack-notifier'


class Elevator < ApplicationRecord
    belongs_to :column
    belongs_to :customer
    has_many :interventions
    def display_name
        "#{id}"
    end 

    # #COMMENT IN OUT FOR TWILIO
    # after_save :send_sms

    def send_sms()
        acct_sid = ENV['TWILIO_ACCT_SID']
        auth_token = ENV['TWILIO_AUTH']

        @client = ::Twilio::REST::Client.new acct_sid, auth_token

        from = ENV['TWILIO_PHONE']
        to = ENV['phone']
        body = ''

        if self.status.downcase == 'intervention'
            body = "The Elevator " + (self.id).to_s + " with Serial Number * " + (self.serial_number).to_s + " * changed status to intervention"
        else
            return
        end

        message = @client.messages.create(
            :from => from,
            :to => to,
            :body => body
        )
    end
    
    # COMMENT IN OUT FOR SLACK
    before_update :slack_notifier


    def slack_notifier
        if self.status_changed?
            notifier = Slack::Notifier.new ENV["SLACK_API_WEBHOOK_URL"]  do
            defaults channel: "#elevator_operations",
            username: "Emma"
            end

            notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
        end
    end
end
  

