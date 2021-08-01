<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="foxtrot.model.*,foxtrot.dao.*,java.sql.*,java.util.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<%
	//prevent Caching of JSP pages
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	//get the session and check if session is null, redirect to login page
	if(session.getAttribute("CurrentSessionUser")==null) response.sendRedirect("CustomerLogin.jsp");
%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- NAVBAR BOOTSTRAP -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<!-- NAVBAR BOOTSTRAP -->

<link rel="stylesheet" href="css/sideBar.css">

<link rel="stylesheet" href="css/form.css">

<title>Update Details</title>
</head>
<body style="background-color:#f5deb3;">

	<!-- SIDENAVBAR-->
	
	<div class="page-wrapper chiller-theme toggled">
	  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#"><i class="fas fa-bars"></i></a>
	  <nav id="sidebar" class="sidebar-wrapper">
	    <div class="sidebar-content">
	    <div class="sidebar-brand"><a href="CustomerPage.jsp">FOXTROT</a><div id="close-sidebar"><i class="fas fa-times"></i></div></div>
	      
	    <div class="sidebar-header">
	       <div class="user-pic"><img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="User picture"></div>
	       <div class="user-info"><span class="user-role">Welcome, <br> <%=session.getAttribute("CurrentSessionUser")%>!</span></div>
	    </div>

		<!-- sidebar-search  -->
		<div class="sidebar-menu">
		<ul>
		  <li><a href="CustomerProfileServlet?custEmail=<%=session.getAttribute("CurrentSessionUser") %>"><i class="fa fa-address-card"></i><span>Profile</span></a></li>
		  <li class="sidebar-dropdown"><a href="#"><i class="fa fa-shopping-cart"></i><span>Orders</span></a>      
			  <div class="sidebar-submenu">
			  	<ul>
			   	<li><a href="CustomerListOrderServlet">Your Order</a></li>
			    <li><a href="CustomerListMenuServlet">New Order</a></li>
			    <li><a href="CustomerCart.jsp">Cart</a></li>
				</ul></div>
		  </li>
		  
		  <li><a href="CustomerLogoutServlet"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li></ul>
		</div></div>
	  </nav>
	  
	  <!-- MAIN CONTENT -->
	  <main class="page-content">
	  <div class="container-fluid"><h4>- Update Details -</h4><hr></div>
		
		  	<!-- ADD FORM -->
			<div class="container">

				<div class="form-sec">
				    
				  <form action="UpdateCustomerServlet" method="post">
				  	<div class="form-group"> 
				      <label>Email :</label>
				      <input type="text" class="form-control" name="custEmail" value="<c:out value="${cust.custEmail}" />" readonly/>
				    </div>
				  	<div class="form-group"> 
				      <label>Name :</label>
				      <input type="text" class="form-control" name="custName" value="<c:out value="${cust.custName}" />"/>
				    </div>
				    <div class="form-group">
				      <label>Password :</label>
				      <input type="text" class="form-control" name="custPassword" value="<c:out value="${cust.custPassword}" />"/>
				    </div>
				    <div class="form-group">
				      <label>Gender:</label><br>
				      <select name="custGender" style="width:350px; height:35px">
				      	   <option value ="<c:out value="${cust.custGender}" />"><c:out value="${cust.custGender}" /></option>
						   <option value ="Male">Male</option>
						   <option value ="Female">Female</option>
					  </select>
				    </div>
				    <div class="form-group">
				      <label>Address :</label>
				      <input type="text" class="form-control" name="custAddress" value="<c:out value="${cust.custAddress}" />"/>
				    </div>
				    <div class="form-group">
				      <label>Contact No :</label>
				      <input type="text" class="form-control" name="custPhone" value="<c:out value="${cust.custPhone}" />"/>
				    </div>
					
					<button type="reset" class="btn btn-default">Reset</button>
				    <button type="submit" class="btn btn-default">Update</button>
				  </form>
				  
				  </div>
				</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  </main>
	  <!-- page-content" -->
	</div>
	
	    
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
jQuery(function ($) {

    $(".sidebar-dropdown > a").click(function() {
  $(".sidebar-submenu").slideUp(200);
  if (
    $(this)
      .parent()
      .hasClass("active")
  ) {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .parent()
      .removeClass("active");
  } else {
    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .next(".sidebar-submenu")
      .slideDown(200);
    $(this)
      .parent()
      .addClass("active");
  }
});

$("#close-sidebar").click(function() {
  $(".page-wrapper").removeClass("toggled");
});
$("#show-sidebar").click(function() {
  $(".page-wrapper").addClass("toggled");
});  
});
</script>
</html>