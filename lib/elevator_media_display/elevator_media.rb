module ElevatorMedia
    class Streamer
        def self.getContent()
            "test string"
        end
        def self.api_request(range)
            require 'uri'
            require 'net/http'
            require 'openssl'
            require 'json'

            url = URI("https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange=#{range}&type=single%2Ctwopart")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV['rapidapi_key']
            request["x-rapidapi-host"] = 'jokeapi-v2.p.rapidapi.com'

            response = http.request(request)

            puts response.read_body
            response.read_body
            JSON.parse(response.read_body)
        end
    end
end 