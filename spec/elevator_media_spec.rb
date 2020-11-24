require 'elevator_media_display/elevator_media'
require 'json'
require 'webmock/rspec'
require 'rails_helper'


joke147 = File.read("./fixtures/joke147response.json")
joke0 = File.read("./fixtures/joke0response.json")


describe ElevatorMedia::Streamer do
    describe ".getContent" do
        context "on run " do
            it "returns a string" do
                stub_request(:get, "https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=0-150&type=single%2Ctwopart")
                .to_return(body: joke0, status:200)
                # p ENV['rapidapi_key']
                expect(ElevatorMedia::Streamer.getContent("0-150")).to be_a(String)
            end
            it "gets an api response and extracts from the repsonse a singel part joke " do
                stub_request(:get, "https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=0-150&type=single%2Ctwopart")
                .to_return(body: joke0, status:200)

                pp ElevatorMedia::Streamer.getContent("0-150")
                expect(ElevatorMedia::Streamer.getContent("0-150")).to  include("I've got a really good UDP joke to tell you but I don’t know if you'll get it.")
        
            end
        end
    end
    describe ".api_request" do
        context "sends 0 to the joke api" do            
            it "returns a specific joke as json object" do
                stub_request(:get, "https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=0&type=single%2Ctwopart")
                .to_return(body: joke0, status:200)
                expect(ElevatorMedia::Streamer.api_request("0")).to eq(JSON.parse({
                    "error": false,
                    "category": "Programming",
                    "type": "single",
                    "joke": "I've got a really good UDP joke to tell you but I don’t know if you'll get it.",
                    "flags":{
                            "nsfw": false,
                            "religious": false,
                            "political": false,
                            "racist": false,
                            "sexist": false
                            },
                    "id": 0,
                    "lang": "en"
                        }.to_json))
            
           
            end
        end
        context "sends range 0-150 to joke api" do
            it "returns a random element from that range" do
                stub_request(:get, "https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=0-150&type=single%2Ctwopart")
                .to_return(body: joke147, status:200)
                expect(ElevatorMedia::Streamer.api_request("0-150")["id"]).to be_between(0, 150).inclusive
            end
        end
    end
    describe ".getjoke" do
        context "from the response of api_request extract the joke" do
            it "returns a 1 liner joke if given a oneliner" do
                expect(ElevatorMedia::Streamer.getjoke(JSON.parse(joke0))).to have_key(:joke)                
            end
            it " returns a 2 step joke if given one" do
              
                expect(ElevatorMedia::Streamer.getjoke(JSON.parse(joke147))).to have_key(:delivery)
                expect(ElevatorMedia::Streamer.getjoke(JSON.parse(joke147))).to have_key(:setup)
            end
       end
    end
end