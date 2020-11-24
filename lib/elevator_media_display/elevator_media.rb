require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require './lib/elevator_media_display/variables.rb'
require 'rails_helper'

module ElevatorMedia
    class Streamer
        def self.getContent()
            "test string"
        end
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
            # 
            if jokeJSON["type"] == "single"
                return joke = {joke: jokeJSON["joke"]}
            elsif jokeJSON["type"] == "twopart"
                return joke = {
                    setup: jokeJSON["setup"],
                    delivery: jokeJSON["delivery"]
                    }
            end
        end
    end
end 
