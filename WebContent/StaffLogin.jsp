<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   
   <!--- LOGIN BOOTSTRAP --->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!--- LOGIN BOOTSTRAP --->
	<link rel="stylesheet" href="css/Flogin.css">
	

</head>
<script>
function myFunction() {
  var x = document.getElementById("staffPassword");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
<body>
	<br>
	<div class="sidenav">
	<div class="login-main-text"><h2>Warung D'Tebing<br></h2><h3>Online Food Ordering System</h3><br><p>Staff Login Page</p></div>
    </div>
    
      <div class="main"><div class="col-md-6 col-sm-12"><div class="login-form">
               
               <form action="StaffLoginServlet" method="post" onsubmit="return validate();">
               <div class="form-group">
                  <label>Staff ID</label>
                  <input type="text" class="form-control" placeholder="ID" name="staffid" required="required">
                </div>
                <div class="form-group">
                   <label>Password</label>
                   <input type="password" class="form-control" placeholder="Password" name="staffPassword" id="staffPassword" required="required">
                </div>
                <div class="form-group">
                   <label>Category : </label>
            	   <select name="staffCategory" style="width:420px; height:35px">
					   <option value ="staff">Staff</option>
					   <option value ="manager">Manager</option>
				</select>
                </div><br><br>
                <button type="submit" name="btn_login" value="login" class="btn btn-black">Login</button>
                
               </form>
            </div></div></div>
</body>
</html>
