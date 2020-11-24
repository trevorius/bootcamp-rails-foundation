require 'webmock/rspec'

module ApiConfig
    class JokeAPI
        def self.stubRangeO()
            stub_request(:get, "https://jokeapi-v2.p.rapidapi.com/joke/Any?blacklistFlags=nsfw,racist&format=json&idRange=0&type=single,twopart").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host'=>'jokeapi-v2.p.rapidapi.com',
          'User-Agent'=>'Ruby',
          'X-Rapidapi-Host'=>'jokeapi-v2.p.rapidapi.com',
          'X-Rapidapi-Key'=>'f1eaf3e6efmsh1ef32e5c70e48d4p1a8c22jsnf186dea5f131'
           }).
         to_return(status: 200, body: {
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
                }, headers: {})
        end
    end
end