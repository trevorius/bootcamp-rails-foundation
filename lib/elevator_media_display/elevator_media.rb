require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require './lib/elevator_media_display/variables.rb'

module ElevatorMedia
    class Streamer
        def self.getContent()
            "test string"
        end
        def self.api_request(range)
            # sends an api request
            url = URI("https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=#{range}&type=single%2Ctwopart")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = $rapid_api_key  
            #            ENV['rapidapi_key'] 
            
            request["x-rapidapi-host"] = 'jokeapi-v2.p.rapidapi.com'
            response = http.request(request)        
            JSON.parse(response.read_body)
        end
    end
end 
