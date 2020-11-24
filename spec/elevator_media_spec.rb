require 'elevator_media_display/elevator_media'
require 'json'

describe ElevatorMedia::Streamer do
    describe ".getContent" do
        context "on run " do
            it "returns a string" do
                expect(ElevatorMedia::Streamer.getContent()).to be_a(String)
            end
        
        end
    end
    describe ".api_request" do
        context "sends 0 to the joke api" do
            it "returns a specific joke as json object" do
                expect(ElevatorMedia::Streamer.api_request("0")).to eq(JSON.parse({
                    "error": false,
                    "category":"Programming",
                    "type":"single",
                    "joke":"I've got a really good UDP joke to tell you but I don’t know if you'll get it.",
                    "flags":{
                            "nsfw":false,
                            "religious":false,
                            "political":false,
                            "racist":false,
                            "sexist":false
                            },
                    "id": 0,
                    "lang": "en"
                        }.to_json))
           
            end
        end
        context "sends range 0-150 to joke api" do
            it "returns a random element from that range" do
                expect(ElevatorMedia::Streamer.api_request("0-150")["id"]).to be_between(0, 150).inclusive
            end
        end
       
    end
end