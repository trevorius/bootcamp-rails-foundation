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
    // break the JSON down and make sure it is valid.
    var subject = await example.jokeJson;
    expect(subject).toHaveProperty("lang", "en");
});

test('extractJoke with a one liner', () => {
    // there are  two types of joke and this test will check oneliners 
    expect(example.extractJoke(joke0)).toBe
        ("I've got a really good UDP joke to tell you but I don’t know if you'll get it.")
});

test('extractJoke with a two liner', () => {
    const twoLiner = "My neighbor is a 90 year old with Alzheimer'"+
                    "s, I see him every morning and he asks me If I've seen his wife. Every day I have to tell this poor man that his wife died 20 years ago."+
                    " I could have moved to another house or even ignore his question.</p><p class="+
                    '"second-line">But the look of joy in his eyes whenever I answer him is worth the world.'
    expect(example.extractJoke(joke147)).toBe(twoLiner)
});

test(' make joke into html string (makeHtmlString)',()=>{
    expect(example.makeHtmlString("string")).toMatch(/<div/)   
});
test ('getContent', async () =>{
    // test the final streamer method
    const test = await  example.getContent("0-150");
    expect(typeof test).toBe('string');
});
test ('getContent is html format', async ()  => {
    // if the string contains the div tags it will display on a html page.
    const test = await  example.getContent("0-150");
    expect(test).toMatch(/<div/)

})