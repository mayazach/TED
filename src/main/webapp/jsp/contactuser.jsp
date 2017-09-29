<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<style>
	table, th, td {
	    border: 1px solid black;
	    border-collapse: collapse;
	}
	th, td {
	    padding: 5px;
	    text-align: left;
	}
	.clickable:hover{
	   background-color: lightblue;
	}
	.sendnew{
	   text-align:right;
	   margin-right:50%;
	
	   
	}
	</style>
<title>ContactUser</title>
</head>
<body>
<h1>Your Messages</h1>
<table style="width:30%">
	  <tr style="color:brown">
	    <th>Subject</th>
	    </tr>
	    <!--<tr class="clickable" data-href="${pageContext.request.contextPath}/roomdetails/${dwm.id}">-->
	    <c:forEach var = "mes" items = "${messages}">
	     <tr class="clickable" data-href="${pageContext.request.contextPath}/readanswer/${mes.id}">
	     <td><c:out value = "${mes.subject}"/></td>
	     </tr>
	    </c:forEach>
	    
	</table>    
	 <form class="sendnew" action="/rooms/sendnew">
	    <input type="submit" value="SEND A NEW MESSAGE"/>
	</form>
	<script type="text/javascript">
	var elements = document.getElementsByClassName('clickable');
	/*location.href="index3.html";*/
	for (var i = 0; i < elements.length; i++) {
	    var element = elements[i];
	    element.addEventListener('click', function() {
	        var href = this.dataset.href;
	        if (href) {
	            window.location.assign(href);
	    
	        }
	    })
	}
	</script>
</body>
</html>