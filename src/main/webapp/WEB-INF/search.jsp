<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
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
</style>
<title>Search results</title>
</head>
<body>
 <table style="width:100%">
  <tr>
    <th>Photo</th>
    <th>Cost</th>
    <th>Type</th>
    <th>Number of beds</th>
    <th>Average rating</th>
    <th>City</th><td>${city}</td>
   <%
   /*Enumeration paramNames = request.getParameterNames();
   while(paramNames.hasMoreElements()) {*/
           /*String paramName = (String)paramNames.nextElement();
           out.print("<tr><td>" + paramName + "</td>\n"); */
             for(int i=0;i<5;i++)
             {
             out.print("<tr>");            
             String Photo="";
             out.print("<td>" + Photo + "</td>\n");
             String Cost="5";
             out.print("<td>" + Cost + "</td>\n");
             String Type="a";
             out.print("<td>" +Type + "</td>\n");
             String Num_beds="30";
    
             out.print("<td>" + Num_beds + "</td>\n");
             String Rating="4";
             out.print("<td>" + Rating + "</td>\n");
             out.print("<td>" + ${city} + "</td>\n");
             /*<c:out value="myVariable"/>
             <h1>${myVariable}</h1>*/
             out.print("</tr>");
             
             }
   %> 
    
  </tr>
  </table>
</body>
</html>