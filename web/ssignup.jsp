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
      <%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
  String email = (String)request.getParameter("email");
   java.util.Random r=new java.util.Random();
            int otp = r.nextInt(1000000);
try{
            String host ="smtp.gmail.com" ;
            String user = "aarohan.shraddha@gmail.com";
            String pass = "shraddhajajoo24*";
            String to = email;
            String from = "aarohan.shraddha@gmail.com";
            String subject = "Account verification ";
            String messageText = "Your otp for Account verfivation :"+otp;
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }

         String dept = (String)request.getParameter("dept");
        String clg = (String)request.getParameter("clg");
        String password =(String)request.getParameter("password");
       
       
        config.Dbconnection d =new Dbconnection();
       boolean  a =  d.insert("INSERT INTO `login`(`userid`, `password`, `clg`, `otp`,`email`) VALUES ('"+dept+"','"+password+"','"+clg+"','"+otp+"','"+email+"')");
    
%>

         <form action="final.jsp" method="POST">
           Enter OTP : <input type="text" name="otp">
           <input type="submit" >  
          
      </form>
      </body>
</html>
