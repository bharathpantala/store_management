<%-- 
    Document   : welcome
    Created on : 18 Sep, 2018, 6:31:52 PM
    Author     : linux
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.util.Date" %>  
Today is: <%= new Date() %>  
<%   
String name=request.getParameter("uname");  
out.print("welcome "+name);  
%>
<%//response.sendRedirect("http://www.google.com"); 
out.print("<br>");
out.print("Welcome "+request.getParameter("uname"));  
String driver=config.getInitParameter("dname");  
out.print("driver name is="+driver); 
out.print("<br>");
String name2=request.getParameter("uname");  
out.print("Welcome "+name);  
session.setAttribute("user",name2);  
%>
<a href="sendrequest.jsp"> second jsp page</a>
 </body>
</html>