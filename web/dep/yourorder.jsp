<%-- 
    Document   : yourorder.jsp
    Created on : 24 Sep, 2018, 3:07:41 PM
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
        </head>
    <body>
  
        <table class="table table-bordered">
            <thead>
      <tr>
        <td>Sr. no.</td><td> Item name</td><td> Quantity</td>
      </tr>
    </thead><tbody>
             <%
             String dep=new String();
             String clg=new String();
             dep=(String)session.getAttribute("dep");
             clg=(String)session.getAttribute("clg");

        config.Dbconnection d =new Dbconnection();
        ResultSet a =  d.select("SELECT (sum((s_qty.qty)*`s_order`.`no_of_stud`)) as qty,s_items.items ,s_order.a_year,s_order.year FROM `s_items` INNER JOIN `s_qty` on s_items.id = s_qty.item_id  INNER JOIN `s_order` on s_order.o_id = s_qty.o_id and s_order.clg='"+clg+"' and dep='"+dep+"' GROUP by s_qty.item_id order by s_items.items");
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
                  <% 
                 out.println(a.getString("items"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
              <td>
                  <% 
                  out.println(a.getString("qty"));
                     //SELECT o.`o_id`,o.`a_year`,o.`year`,o.`clg` FROM `s_order` o,`s_qty` q,`s_items` i 
                  %>
                </td>
              </tr>      
             <%  
             i++;   
           }
        %>  </tbody>
        </table>
    </body>
</html>
