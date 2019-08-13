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
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        </head>
        
    <body>
  
        <h2>${message}</h2>
        <div class="container">
            <%
                String dep=new String();
                String clg=new String();
                dep=(String)session.getAttribute("dep");
                clg=(String)session.getAttribute("clg");
                String a_year = request.getParameter("a_year");
                
                out.print("<h3> Placed order of : "+clg+" - "+dep+" - "+a_year+"</h3>");
            %>
        <table class="table table-bordered">
            <thead>
      <tr>
        <td>Sr. no.</td><td> Item name</td><td> Quantity</td>
      </tr>
    </thead><tbody>
             <%
        config.Dbconnection d =new Dbconnection();
        ResultSet a =  d.select("SELECT s_qty.qty*`s_order`.`no_of_stud` as qty,s_items.items ,s_order.a_year,s_order.year FROM `s_items` INNER JOIN `s_qty` on s_items.id = s_qty.item_id  INNER JOIN `s_order` on s_order.o_id = s_qty.o_id and s_order.clg='"+clg+"' and dep='"+dep+"'and a_year = '"+a_year+"' GROUP by s_qty.item_id order by s_items.items");
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
        
    <center><a href="index.jsp"><button style="width:30%;" class="btn-primary form-control">Back</button></a></center>
        </div>
    </body>
</html>
