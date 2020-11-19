console.log("loading customerinformtion.js")





//DOM Ready manipulation
$(function() {
    
    $("#customer-ID").on('change',function(event){
        ID = $('#customer-ID').val();
        sendToAPIs(ID);        
    });
    

    // $("#REST-response").text( "The div is now loaded and can be manipulated." );
});



//functions called in Dom ready

function sendToAPIs(id){
    getToRESTApi(id);
    // postToGraphQLApi(id);
};


function getToRESTApi(id) {
    $.ajax({
        type: "GET",
        url: `https://rocket-elevators-status.azurewebsites.net/api/customers/customer-${id}-pruducts`,
        dataType: 'JSON',            
        success: (data) => { 
            
            $("#REST-response").html("<p> Buildings : " + data.Buildings + "</p><p>Elevators : " + data.Elevators + "</p>" );

            console.log(data)
        }
    })
};

function postToGraphQLApi(id){

    // $.ajax({
    //     method: "POST",
    //     url: "https://rocket-elevator-graphql-api.herokuapp.com/graphql",
    //     contentType: "application/json",
    //     data: JSON.stringify({
    //       query: `{
    //                 customerinfo (id: 2){
    //                 customer{
    //                     id
    //                     companyName
    //                     buildings{
    //                     addressOfTheBuilding
    //                     batteries{
    //                         id
    //                         status
    //                         columns{
    //                         id
    //                         elevators{
    //                             id
    //                         }
    //                         }
                
    //                     }
    //                     }
    //                 }
    //                 }
    //                 }`

    //     }),
    //     success: (d) => { 
    //         alert("remote post sent!");
    //         //         //JSON.parse(data);
    //         //         //console.log(data.Buildings)
    //         console.log("remote ")
    //         console.log(JSON.stringify(d))
    //     }
    // })


    // $.ajax({
    //     method: "POST",
    //     url: "https://rocket-elevator-graphql-api.herokuapp.com/graphql",
    //     contentType: "application/json",
    //     data: JSON.stringify({
    //       query: `{newquery1 (id: ${id}) {
    //     interventions{
    //         startDateIntervention
    //         }
    //     }
    // }`


    //     }),
    //     success: (d) => { 
    //         alert("post sent!");
    //         //         //JSON.parse(data);
    //         //         //console.log(data.Buildings)
    //         console.log(JSON.stringify(d))
    //     }
    // })
    
    // $.ajax({
    //     method: "POST",
    //     // url: " https://rocket-elevator-graphql-api-tk.herokuapp.com/graphql",
    //     url: "http://localhost:3002/graphql",
    //     contentType: "application/json",
    //     data: JSON.stringify({
    //       query: `{
    //                 customerinfo (id: ${id}){
    //                 customer{
    //                     id
    //                     companyName
    //                     buildings{
    //                     addressOfTheBuilding
    //                     batteries{
    //                         id
    //                         status
    //                         columns{
    //                         id
    //                         elevators{
    //                             id
    //                         }
    //                         }
                
    //                     }
    //                     }
    //                 }
    //                 }
    //                 }`

    //     }),
    //     success: (d) => { 
    //         alert("local post sent!");
    //         //         //JSON.parse(data);
    //         //         //console.log(data.Buildings)
    //         console.log(JSON.stringify(d))
    //         console.log(d.data.customerinfo.customer.companyName)
    //     }
    // })
    

};