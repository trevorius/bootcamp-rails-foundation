console.log("loading customerinformtion.js")





//DOM Ready manipulation
$(function() {
    
    $("#customer-ID").on('change',function(event){
        ID = $('#customer-ID').val();
        sendToAPIs(ID);        
    });
    

    $("#REST-response").text( "The div is now loaded and can be manipulated." );
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
    
};