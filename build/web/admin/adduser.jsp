<%-- 
    Document   : additem
    Created on : 24 Sep, 2018, 7:15:48 PM
    Author     : linux
--%>

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
      
         <form action="Adduser" method="POST">
             enter uerid : <input type="text" name="userid">  
             enter password : <input type="text" name="password">
             enter clg :    <input type="text" name="password"> 
             enter institue :<input type="text" name="password">
             <input type="submit" >  <br><br>
             <h1>User</h1>
         <table>
            <tr><td>User</td><td> clg</td><td> institute</td></tr>
             <%
        config.Dbconnection d =new Dbconnection();
        ResultSet a =  d.select("select * from login");
        String kk=new String();
        String value= new String();
        while(a.next())
           {
              %>
              <tr> <td>
                  <% 
                  out.println(a.getString("userid"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td><td>
                  <% 
                  out.println(a.getString("clg"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
                <td>
                  <% 
                  out.println(a.getString("institute"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
             </tr>      
             <%     
           }
        %>
        </table><br>
        </form>
        
    </body>
</html>
