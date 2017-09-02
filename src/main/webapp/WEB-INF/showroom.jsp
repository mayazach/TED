<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>show room</title>
</head>
<body>
hello room <br>
<%
            String beds = request.getParameter("bedsPar");
            String price=request.getParameter("pricePar");
%>
Number of beds : <%=beds %><br/>
<br> 
Price:<%=price %><br/>
</body>
</html>