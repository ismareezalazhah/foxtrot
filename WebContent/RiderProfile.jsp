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
	if(session.getAttribute("CurrentSessionUser")==null) response.sendRedirect("RiderLogin.jsp");
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


<title>Rider Profile</title>
</head>
<body style="background-color:#f5deb3;">

	<!-- SIDENAVBAR-->
	
	<div class="page-wrapper chiller-theme toggled">
	  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#"><i class="fas fa-bars"></i></a>
	  <nav id="sidebar" class="sidebar-wrapper">
	    <div class="sidebar-content">
	    <div class="sidebar-brand"><a href="RiderPage.jsp">FOXTROT</a><div id="close-sidebar"><i class="fas fa-times"></i></div></div>
	      
	    <div class="sidebar-header">
	       <div class="user-pic"><img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="User picture"></div>
	       <div class="user-info"><span class="user-role">Welcome, <%=session.getAttribute("CurrentSessionUser")%>!</span></div>
	    </div>

		<!-- sidebar-search  -->
		<div class="sidebar-menu">
		<ul>
		  <li><a href="RiderProfileServlet?riderid=<%=session.getAttribute("CurrentSessionUser") %>"><i class="fa fa-address-card"></i><span>Profile</span></a></li>
		  <li class="sidebar-dropdown"><a href="#"><i class="fa fa-shopping-cart"></i><span>Orders Management</span></a>      
			  <div class="sidebar-submenu">
			  	<ul>
			   	<li><a href="RiderOrderServlet?riderid=<%=session.getAttribute("CurrentSessionUser") %>">Available Order</a></li>
				</ul></div>
		  </li>        
		  
		  <li><a href="RiderLogoutServlet"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li></ul>
		</div></div>
	  </nav>
	  
	  <!-- MAIN CONTENT -->
	  <main class="page-content">
	  <div class="container-fluid"><h4>- Profile Card -</h4><hr></div>
		
	  <!--- PROFILE CARD --->

		<div class="container"><br>
	    
	    <div class="main-body">
	    
	          <div class="row gutters-sm"><div class="col-md-8"><div class="card mb-3"><div class="card-body">
	                  
	          <div class="row">
	          <div class="col-sm-3"><h6 class="mb-0">Rider ID</h6></div><div class="col-sm-9 text-secondary"><c:out value="${ri.riderid}"/></div></div><hr>
	          
			  <div class="row">
	          <div class="col-sm-3"><h6 class="mb-0">Name</h6></div><div class="col-sm-9 text-secondary"><c:out value="${ri.riderName}"/></div></div><hr>
	          
	          <div class="row">
	          <div class="col-sm-3"><h6 class="mb-0">Password</h6></div><div class="col-sm-9 text-secondary"><c:out value="${ri.riderPassword}"/></div></div><hr>
	                  
	          <div class="row">
	          <div class="col-sm-3"><h6 class="mb-0">Contact No</h6></div><div class="col-sm-9 text-secondary"><c:out value="${ri.riderPhone}"/></div></div><hr>
	          
	          <div class="row">
	          <div class="col-sm-3"><h6 class="mb-0">Status</h6></div><div class="col-sm-9 text-secondary"><c:out value="${ri.riderStatus}"/></div></div><hr>

	          <div class="row">
	          <div class="col-sm-12"> 
	          <a href="RiderUpdateDetailServlet?riderid=<c:out value="${ri.riderid}" />"><button type="button" class="btn btn-default">Edit</button></a>		<!-- update button style -->
	          </div>
	          </div>
	          
	          </div></div></div></div>
	          
	    </div><br><br><br><br>
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