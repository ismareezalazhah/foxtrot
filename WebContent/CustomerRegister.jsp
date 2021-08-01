<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

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
	<div class="login-main-text"><h2>Warung D'Tebing<br></h2><h3>Online Food Ordering System</h3><br><p>Customer Registration Page</p></div>
    </div>
    
      <div class="main"><div class="col-md-6 col-sm-12"><div class="register-form">
               <form action="CustomerRegisterServlet" method="post">
               <div class="form-group">
               <label>Customer Email</label>
               <input type="text" class="form-control" placeholder="Email" name="custEmail" required="required">
               </div>
               
               <div class="form-group">
               <label>Your Name</label>
               <input type="text" class="form-control" placeholder="Full Name" name="custName" required="required">
               </div>
               
                <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" placeholder="Password" name="custPassword" required="required">
                </div>
                
                <div class="form-group">
                
                <label>Gender</label>
                <select name="custGender" style="width:420px; height:35px">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                </select>
                </div>
    
                <div class="form-group">
                <label>Customer Address</label>
                <input type="text" class="form-control" placeholder="Location/Home Address" name="custAddress" required="required">
                </div>
                
                <div class="form-group">
                <label>Contact No.</label>
                <input type="text" class="form-control" placeholder="Contact No" name="custPhone" required="required">
                </div>
 
 				<a href="CustomerLogin.jsp"><button type="button" class="btn btn-secondary">Login Page</button></a>
                <button type="submit" class="btn btn-black">Register</button>
               
               </form>
            </div></div></div><br><br><br><br><br><br><br><br><br><br><br>


</body>
</html>