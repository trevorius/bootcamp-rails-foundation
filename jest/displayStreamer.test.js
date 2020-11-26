const Streamer = require('../lib/elevatorMedia.js');
// const $ = require('jquery');
let example = new Streamer();

const joke0 = require('../fixtures/joke0response.json')
const joke147 = require('../fixtures/joke147response.json')




// verify class import works
test('test function', () => {

        expect(example.testing("string")).toBe("test string")

});

    
test('joke api call by verrifying the language of the joke.', async () => {
    // changed the timeout limit just incase
    jest.setTimeout(8000);
    // async function requires the result to await.
    const data = await example.getJoke("0-150");
    // verrifie the property of the returned body .
    expect(data).toHaveProperty("lang", "en"); 
});
test ('joke value ', async () =>{

    var subject = await example.jokeJson;

    expect(subject).toHaveProperty("lang", "en");
});

    
