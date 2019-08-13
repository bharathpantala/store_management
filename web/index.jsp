<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style type="text/css">
  
 .tales {
  width: 100%;
}
.carousel-inner{
  width:100%;
  max-height: 500px !important;
}
</style>
<!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head> 
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Store Management</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
  
</ul>
 
  </div>
</nav>



<div class="container">

<div class="row">
<div class="col-sm-4"></div>
  <div class="col-sm-4">
    <div class="card">
      <article class="card-body">
    	  <h4 class="card-title text-center mb-4 mt-1">Sign in</h4>
      <hr>
      <form action="ControllerServlet" method="post"> 
        <h3 style="color: red">${errorMessage}</h3>
      <div class="form-group">
      <div class="input-group">
      <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fa fa-building"></i> </span>
      </div>
      <select class="form-control" name="clg">
           
           <%
            config.Dbconnection con = new config.Dbconnection();
            ResultSet s = con.select("select distinct(clg) from login");
            while(s.next())
            {
              out.print("<option>"+s.getString("clg")+"</option>");
            }
           %>
   
        </select>
    </div> <!-- input-group.// -->
      </div> <!-- form-group// -->
         <div class="form-group input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
        </div>
        <select class="form-control" name="userid">
             <%
                s = con.select("select distinct(userid) from login");
            while(s.next())
            {
              out.print("<option>"+s.getString("userid")+"</option>");
            }
           %>
        </select>
    </div> <!-- form-group end.// -->
      <div class="form-group">
      <div class="input-group">
      <div class="input-group-prepend">
      <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
      </div>
      <input class="form-control" placeholder="******" type="password" name="password">
      </div> <!-- input-group.// -->
      </div> <!-- form-group// -->
           
      <div class="form-group">
      <button type="submit" class="btn btn-primary btn-block"> Login  </button>
      </div> <!-- form-group// -->
      </form>
      </article>
      </div> <!-- card.// -->
  </div>
  <div class="col-sm-4"></div>
</div>
  

</div>
</body>
</html>