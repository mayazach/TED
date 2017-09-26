$(document).ready(function(){
$.ajax({type: "GET", 
		url: origin+ "/rooms/logged",
        context: document.body,
        success: function (response) {
        	console.log(response);
        	if(response != "anonymous"){
        		$('#loginbar').hide();
        		$('#logoutbar').show();
        	}
        },
        error: function (xhr,status,error) {
        	console.log(origin + "/rooms/logged")
            console.log(error);
        },
        async: true,
        cache: false,
        contentType: false,
        processData: false,
        timeout: 60000

});
});