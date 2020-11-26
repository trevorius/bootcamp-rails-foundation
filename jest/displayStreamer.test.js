const Streamer = require('../lib/elevatorMedia.js');
// const $ = require('jquery');
// import * as ElevatorMedia from '../lib/elevatorMedia.js'
let example = new Streamer();

test('test function', () => {

        expect(example.testing("string")).toBe("test string")

});

    // test('joke api', done => {
    //     jest.setTimeout(8000);
    // function callback(data){
      
    //     try{
    //         expect(data).toContain({"lang": "en"});
    //         done();        
    //     }catch (error){
    //         expect(data).toThrow(Timeout);
    //         done(error);
    //     }
    // }
    // example.getJoke(callback);
    // });

    // test('joke api', async () => {
    //     jest.setTimeout(8000);

    // await expect(example.getJoke()).resolves.toContain({"lang": "en"})
    // });
    // test('joke api fails with an error', async () => {
    //     await expect(example.getJoke()).rejects.toThrow('error');
    // });
      
      
      

    // test('joke api', () => {
    //     jest.setTimeout(8000);

    //     return expect(example.getJoke()).resolves.toContain({"lang": "en"});
    
    // });

    test('joke api', async () => {
        jest.setTimeout(8000);

        const data = await example.getJoke();
        expect(data).toHaveProperty("lang", "en"); 
    });

    // test('joke api fails with an error', async () => {
    //     jest.setTimeout(8000);

    //     expect.assertions(1);
    //     try {
    //       await example.getJoke();
    //     } catch (e) {
    //       expect(e).toMatch('error');
    //     }
    //   });

