$(document).ready(function(){
	document.getElementById("submit").disabled = true;
});

document.getElementById("uname").onblur = function(){
				var username = document.getElementById("uname").value;
				$.ajax({type: "GET", 
					url: origin+ "/rooms/usernameExists/" + username,
			        context: document.body,
			        success: function (response) {
			        	if(response == "false"){
			        		document.getElementById("ucheck").innerHTML = "OK";
							document.getElementById("ucheck").style.color = "green";
			        	}
			        	else{
			        		document.getElementById("ucheck").innerHTML = "This username already exists";
							document.getElementById("ucheck").style.color = "red";
			        	}
			        },
			        error: function (xhr,status,error) {
			        	console.log(origin + "/rooms/usernameExists/" + username)
			            console.log(error);
			        },
			        async: true,
			        cache: false,
			        contentType: false,
			        processData: false,
			        timeout: 60000

			});
			}

			document.getElementById("pword").onblur = function(){
								var element = this.value;
								if(element.length < 8){
									document.getElementById("pcheck").innerHTML = "Password must be at least 8 characters long";
									document.getElementById("pcheck").style.color = "red";
								}
								else{
									document.getElementById("pcheck").innerHTML = "OK";
									document.getElementById("pcheck").style.color = "green";
								}
							}
							
			document.getElementById("confpw").onblur = function(){
								var element = this.value;
								if(element != document.getElementById("pword").value){
									document.getElementById("confcheck").innerHTML = "Passwords don't match";
									document.getElementById("confcheck").style.color = "red";
								}
								else{
									document.getElementById("confcheck").innerHTML = "OK";
									document.getElementById("confcheck").style.color = "green";
								}
							}
			
$(":input").blur(function() {
	var inputs = document.getElementById("registerform").elements;
	var cansubmit = true;
	for (var i = 0; i < inputs.length; i++) {
        if(inputs[i].value.length == 0 && inputs[i].name != "filename")
        	cansubmit = false;
    }
	if(document.getElementById("ucheck").textContent != "OK")
		cansubmit = false;
	if(document.getElementById("pcheck").textContent != "OK")
		cansubmit = false;
	if(document.getElementById("confcheck").textContent != "OK")
		cansubmit = false;
	if(cansubmit == true)
		document.getElementById("submit").disabled = false;
	else
		document.getElementById("submit").disabled = true;
});