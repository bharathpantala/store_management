<%-- 
    Document   : additem
    Created on : 24 Sep, 2018, 7:15:48 PM
    Author     : linux
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.UUID"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            table,td,tr{
                border-collapse:collapse;
                border:1px solid black;
            }
        </style>
    </head>
    <body>
   
<%
  String otp = (String)request.getParameter("otp");
  
      
       
        
     config.Dbconnection d =new Dbconnection();
        ResultSet a=  d.select("SELECT * FROM `login` where `otp`='"+otp+"'");
        a.next();
        int  k=a.getRow();
        if(k!=0)
        {
            out.print("sucess");
                response.sendRedirect("index.jsp");
               int t=d.update("update login set otp='' where `otp`='"+otp+"'");
        } 
    else
        {
            out.print("Wrong otp");
                //sresponse.sendRedirect("ssignup.jsp");
        }
       
    
%>

         
