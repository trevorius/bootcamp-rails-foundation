require 'elevator_media_display/elevator_media'
require 'json'
require 'webmock/rspec'
require 'rails_helper'


joke147 = File.read("./fixtures/joke147response.json")
joke0 = File.read("./fixtures/joke0response.json")

def stub(range)
    stub_request(:get, "https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=#{range}&type=single%2Ctwopart")
end



describe ElevatorMedia::Streamer do
    describe ".getContent" do
        context "on run " do
            it "returns a string" do
                stub("0-150").to_return(body: joke0, status:200)
                expect(ElevatorMedia::Streamer.getContent("0-150")).to be_a(String)
            end
            it "gets an api response and extracts from the repsonse a singel part joke " do
                stub("0-150").to_return(body: joke0, status:200)
                expect(ElevatorMedia::Streamer.getContent("0-150")).to  include("I've got a really good UDP joke to tell you but I don’t know if you'll get it.")
        
            end
            it "gets an api response and extracts from the repsonse a two part joke " do
                stub("0-150").to_return(body: joke147, status:200)
                # first line
                expect(ElevatorMedia::Streamer.getContent("0-150")).to  include("My neighbor is a 90 year old with Alzheimer's, I see him every morning and he asks me")
                # second line
                expect(ElevatorMedia::Streamer.getContent("0-150")).to  include("ut the look of joy in his eyes whenever I answer him is worth the world.")
                # contains an html tag to change line as a new paragraph
                expect(ElevatorMedia::Streamer.getContent("0-150")).to  include('</p><p class="second-line">')
            end
            it "returns a full html string ready to include in a streamer" do
                stub("0-150").to_return(body: joke147, status:200)
                expect(ElevatorMedia::Streamer.getContent("0-150")).to start_with('<div ')
                expect(ElevatorMedia::Streamer.getContent("0-150")).to end_with('</div>')
            end
        end
    end
    describe ".api_request" do
        context "sends 0 to the joke api" do            
            it "returns a specific joke as json object" do
                stub("0").to_return(body: joke0, status:200)
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
                stub("0-150").to_return(body: joke147, status:200)
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
    describe ".addTags" do
        context "given a string" do
            it "adds a div, paragraphe with class tag to start and finish" do
                expect(ElevatorMedia::Streamer.addTags("test String")).to start_with('<div class="streamer"><p class="first-line">')
                expect(ElevatorMedia::Streamer.addTags("test String")).to end_with('</p></div>')
            end
        end
    end
end