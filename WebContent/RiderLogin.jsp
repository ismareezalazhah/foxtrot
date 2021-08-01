<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rider Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!--- LOGIN BOOTSTRAP --->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!--- LOGIN BOOTSTRAP --->
	<link rel="stylesheet" href="css/Flogin.css">
	

</head>
<body>
<br>
	<div class="sidenav">
	<div class="login-main-text"><h2>Warung D'Tebing<br></h2><h3>Online Food Ordering System</h3><br><p>Rider Login Page</p></div>
    </div>
    
      <div class="main"><div class="col-md-6 col-sm-12"><div class="login-form">
               
               <form action="RiderLoginServlet" method="post" onsubmit="return validate();">
               <div class="form-group">
                  <label>Rider ID</label>
                  <input type="text" class="form-control" placeholder="ID" name="riderid" required="required">
                </div>
                <div class="form-group">
                   <label>Password</label>
                    <input type="password" class="form-control" placeholder="Password" name="riderPassword" required="required">
                </div>

                <button type="submit" name="btn_login" value="login" class="btn btn-black">Login</button>
                
               </form>
            </div></div></div>

	<br>

</body>
</html>