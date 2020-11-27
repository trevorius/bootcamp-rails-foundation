const $ = require('jquery')
const fetch = require('node-fetch')

class Streamer{
    
    // the main function that will return a html string ready to be inserted to the DOM
    async getContent(range){
        var JokeJson = this.getJoke(range);         
        var subject = await JokeJson;
        var Joke = this.extractJoke(subject) ;
        var result = this.makeHtmlString(Joke)
       return result    
    }

    // a test to check import of class into jest
    testing(string){
         return "test " + string
     }
    // the getjoke function makes a call to the api (async)
    async getJoke(range){        
        
        // must wait for the answer to continue await <=> async
        const response = await fetch("https://jokeapi-v2.p.rapidapi.com/joke/Any?format=json&blacklistFlags=nsfw%2Cracist&idRange="+range+"&type=single%2Ctwopart", {
            "method": "GET",
            "headers": {
                "x-rapidapi-key": "f1eaf3e6efmsh1ef32e5c70e48d4p1a8c22jsnf186dea5f131",
                "x-rapidapi-host": "jokeapi-v2.p.rapidapi.com"
            }
        })
        // .json is async so must be await.
        const body = await response.json();
        return body;
    }
    jokeJson =  this.getJoke("0-150")
    // extract the joke from the returned Json of api call
    extractJoke(subject) {
        var joke
        // joke can be a single or two liner
        if(subject.type == "single"){
            joke = subject.joke
            
        }else if (subject.type == "twopart"){
             joke = subject.setup+ '</p><p class="second-line">' + subject.delivery
            
        }
        return joke

    }
    // add html tags to the beggining and end of the string
    makeHtmlString(string){
        var newString = '<div class="streamer"><p class="first-line">' + string + '</p></div>'
        return newString
    }

}


module.exports = Streamer

