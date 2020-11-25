require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require './lib/elevator_media_display/variables.rb'
require 'rails_helper'

module ElevatorMedia
    class Streamer

        def self.getContent(range)
            # make the request
            result = self.api_request(range)
            # extract the joke from the response
            joke = self.getjoke(result)
            # take the joke string
            jokeString = joke[:joke]
            # format to become an html string
            htmlString = self.addTags(jokeString)            
        end

    private
        # sends an api request hoping for a joke to display
        def self.api_request(range)
            url = URI("https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=#{range}&type=single%2Ctwopart")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV['rapidapi_key'] 
            request["x-rapidapi-host"] = 'jokeapi-v2.p.rapidapi.com'
            response = http.request(request)        
            JSON.parse(response.read_body)
        end
        # extract the joke from the API resonse
        def self.getjoke(jokeJSON)
            # determin what type of joke it is 
            if jokeJSON["type"] == "single"
                return joke = {joke: jokeJSON["joke"]}
            elsif jokeJSON["type"] == "twopart"
                # concatinate the two parts and add html to change paragraphs
                jokestring = jokeJSON["setup"] + '</p><p class="second-line">' + jokeJSON["delivery"]
                return joke = {
                    setup: jokeJSON["setup"],
                    delivery: jokeJSON["delivery"],
                    joke: jokestring
                    }
            end
        end
        def self.addTags(string)
            htmlString = '<div class="streamer"><p class="first-line">' + string + '</p></div>' 
        end
        

    end
end 
