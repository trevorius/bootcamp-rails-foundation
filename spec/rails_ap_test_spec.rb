# require 'elevator_media_display/elevator_media'
require 'json'
require 'webmock/rspec'
require 'rails_helper'
require './app/controllers/quotes_controller'
require './app/models/intervention.rb'
# require './app/controllers/admin_users_controller.rb'


RSpec.describe QuotesController, :type => :controller do
    describe "create" do
        context "new quote creation" do
            it "return status 302" do
                stub_request(:post, "https://rocket-elevators-supporthelp.zendesk.com/api/v2/tickets").
                to_return(status: 200, body: "", headers: {})
                get :create
                expect(response.status).to eq 302
            end
        end
    end
end

RSpec.describe Intervention, :type => :model do
    describe "intervention creation" do
        # define a dummy subject to run tests on
        subject{Intervention.new(
                author: 3, 
                customer_id: 4, 
                building_id: 8, 
                battery_id: nil, 
                column_id: nil, 
                elevator_id: nil, 
                employee_id: 25, 
                start_date: nil, 
                end_date: nil, 
                result: "incomplete", 
                report: "lorem ipsum", 
                status: "Pending"
                )}
        

        context "on subject creation" do
            it "should be valid" do
                expect(subject).to be_valid
            end
        end
        context "given subject2 without a customer id" do
            it " will not be valid" do
                subject2 = subject
                subject2["customer_id"] = nil
                expect(subject2).to_not be_valid
            end
        end
        context "dummy columnId field is nil" do
            it "will give an empty string for Zendesk to use" do
         
                expect(subject.columnId(subject)).to eq("")
            end
        end
    end
end



    # before do
    # AdminUsersController.verify_authenticity_token = true
    # end 

    # RSpec.describe AdminUsersController, :type => :controller do
        
        
    
    
    #     after do
    #         ActionController::Base.verify_authenticity_token = false
    #     end
        
    #     describe "authentication verification" do
    #         context "upon-load of admin section the security token is checked" do
    #             it "will pass the authentication" do 
    #             expect(:verify_authenticity_token).to be_truthy              
    #             end
    #         end
    #     end
        
    # end

# expect(AdminUsersControler.index.count).to eq(AdminUser.all.count)