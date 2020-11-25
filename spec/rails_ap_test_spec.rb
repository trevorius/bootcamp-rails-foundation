# require 'elevator_media_display/elevator_media'
require 'json'
require 'webmock/rspec'
require 'rails_helper'
# require './app/controllers/quotes_controller'

# RSpec.describe QuotesController, :type => :controller do
#     describe "index" do
#         context "on run" do
#             it"displays all admin users from the database" do
#                 expect(QuotesController.index.count).to eq(Quote.all.count)
#                 expect(QuotesController.index).to be_a(Array)
#             end
#         end   
#     end
# end

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