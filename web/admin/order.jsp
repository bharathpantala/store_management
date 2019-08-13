<%-- 
    Document   : order
    Created on : 24 Sep, 2018, 5:55:33 PM
    Author     : linux
--%>

<%@page import="config.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
    <div class="container">
      

        Report :<br>
        <table class="table table-bordered">
            <thead>
                <tr><td>Sr.</td><td>Clg</td><td>Department</td><td>Academic Year</td><td> Year</td><td>No of student </td></tr> </thead><tbody>
             <%
        config.Dbconnection d =new Dbconnection();
        ResultSet a =  d.select("select * from s_order ");
        String kk=new String();
        String value= new String();
        int i;
        i=1;
        while(a.next())
           {
              %>
              <tr> <td>
                  <% 
                  out.println(i);
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td><td>
                  <%   out.println(a.getString("clg"));
                
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
                <td>
                  <% 
                  out.println(a.getString("dep"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
              <td>
                  <%   out.println(a.getString("a_year"));
               
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
              <td>
                  <% 
                       out.println(a.getString("year"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
                <td>
                  <% 
                       out.println(a.getString("no_of_stud"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
              </tr>      
             <%     
             i++;
           }
        %> </tbody>
        </table>
           </div> <a href="index.jsp"> <button >home</button></a>
    </body>
</html>
