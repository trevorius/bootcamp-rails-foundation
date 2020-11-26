const $ = require('jquery')
const fetch = require('node-fetch')

class Streamer{
    testing(string){
         return "test " + string
     }
    async getJoke(){        
        
       
                const response = await fetch("https://jokeapi-v2.p.rapidapi.com/joke/Any?contains=C%2523&format=json&blacklistFlags=nsfw%2Cracist&idRange=0-150&type=single%2Ctwopart", {
                    "method": "GET",
                    "headers": {
                        "x-rapidapi-key": "f1eaf3e6efmsh1ef32e5c70e48d4p1a8c22jsnf186dea5f131",
                        "x-rapidapi-host": "jokeapi-v2.p.rapidapi.com"
                    }
                })
                       
                const body = await response.json();
                console.log(body);
                return body;

                    // // console .log(result);
                    
                        
                    
                    // fetch("https://jokeapi-v2.p.rapidapi.com/joke/Any?contains=C%2523&format=json&blacklistFlags=nsfw%2Cracist&idRange=0-150&type=single%2Ctwopart", {
                    //     "method": "GET",
                    //     "headers": {
                    //         "x-rapidapi-key": "f1eaf3e6efmsh1ef32e5c70e48d4p1a8c22jsnf186dea5f131",
                    //         "x-rapidapi-host": "jokeapi-v2.p.rapidapi.com"
                    //     }
                    // })
                    // .then(response => {
                    //     console.log(response);
                    // })
                    // .catch(err => {
                    //     console.error(err);
                    // });
                            
                            
                            //     const settings = {
                                //     "async": true,
                                //     "crossDomain": true,
                                //     "url": "https://community-open-weather-map.p.rapidapi.com/weather?q=Quebec&callback=test&id=2172797&lang=null&units=%22metric%22%20or%20%22imperial%22",
                                //     "method": "GET",
                                //     "headers": {
                                    //         "x-rapidapi-key": "f1eaf3e6efmsh1ef32e5c70e48d4p1a8c22jsnf186dea5f131",
                                    //         "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com"
                                    //     }
                                    // };
                                    
                                    // $.ajax(settings).done(function (response) {
                                        // console.log(response);
                                        // return response
                                        // });
                                        
                                        
                                        
                                        // const response = await fetch("https://jokeapi-v2.p.rapidapi.com/joke/Any?contains=C%2523&format=json&blacklistFlags=nsfw%2Cracist&idRange=0-150&type=single%2Ctwopart", {
                                            // "method": "GET",
                                            // "headers": {
                                                //     "x-rapidapi-key": "f1eaf3e6efmsh1ef32e5c70e48d4p1a8c22jsnf186dea5f131",
                                                //     "x-rapidapi-host": "jokeapi-v2.p.rapidapi.com"
                                                // }
                                                // })
                                                // const json = await response.json();
                                                
                                                // return json


                                            // .then(response => {
                                                //     console.log(response);
                                                // })
                                                // .catch(err => {
                                                    //     console.error(err);
                                                    // }); 
                                                    
            
    }
    
}


module.exports = Streamer

