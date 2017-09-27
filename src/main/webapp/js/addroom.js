$(document).ready(function(){
	document.getElementById("submit").disabled = true;
});


$(":input").blur(function() {
	var inputs = document.getElementsByClassName("necessary");
	var cansubmit = true;
	

	for (var i = 0; i < inputs.length; i++) {
           if(inputs[i].value.length == 0)
        	{
        	cansubmit = false;
        	}
	}
	if(cansubmit == true)
		document.getElementById("submit").disabled = false;
});