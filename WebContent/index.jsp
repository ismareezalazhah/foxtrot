<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="newcss/indexstyle.css"/>
<title>Warung D'Tebing Delivery System</title>
</head>

<body background = "image/3.jpg">
<br><br><br><br><br><br><br>
<table align="center" cellpadding="2" cellspacing="2" border="2" width="50%">
	<tr bgcolor="#d1e0e0" align="center">
		<td colspan="2"><h2>Welcome To Warung D'Tebing Restaurant</h2></td>
	</tr>
</table>

<br><br><br>

	<form action="" method="post">
	  <div class="container" align="center">
	    <b>Email</b><br>
	    <input type="text" placeholder="Enter Email Address" name="email" required><br>
	
	    <b>Password</b><br>
	    <input type="password" placeholder="Enter Password" name="password" required><br>
	    
	    <label>
	      <input type="checkbox" checked="checked" name="remember"> Remember me
	    </label><br>
<!--	<button type="submit">Don't Have Account Yet? Register Now</button>
	    <button type="submit">Login</button><br>
-->	    
		<a href="https://foxtrot-fooddelivery-system.herokuapp.com/view.jsp"><button type="button" class="view">Login</button>
	  </div>
	</form>
</body>
