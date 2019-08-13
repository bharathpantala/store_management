<%-- 
    Document   : error
    Created on : 18 Sep, 2018, 7:15:07 PM
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
<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
out.println((String) session.getAttribute("log"));
session.invalidate();
response.sendRedirect("index.jsp");
%>  
    </body>
</html>
