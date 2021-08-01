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
<link rel="stylesheet" href="css/form.css">


<title>Details Update</title>
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
	  <div class="container-fluid"><h4>- Rider Section -</h4><hr></div>
		
	  <!-- ADD FORM -->
		
			<div class="container">

				<div class="form-sec">
				    
				  <form action="RiderUpdateDetailServlet" method="post">
				  	<div class="form-group">
				      <label>Rider ID :</label>
				      <input type="text" class="form-control" name="riderid" value="<c:out value="${ri.riderid}" />" readonly/>
				    </div>
				  	<div class="form-group"> 
				      <label>Name :</label>
				      <input type="text" class="form-control" name="riderName" value="<c:out value="${ri.riderName}" />"/>
				    </div>
				    <div class="form-group">
				      <label>Password :</label>
				      <input type="text" class="form-control" name="riderPassword" value="<c:out value="${ri.riderPassword}" />"/>
				    </div>
				    <div class="form-group">
				      <label>Contact No:</label>
				      <input type="text" class="form-control" name="riderPhone" value="<c:out value="${ri.riderPhone}" />"/>
				    </div>
				    <div class="form-group">
				      <label>Status :</label>
				      <select name="riderStatus" style="width:350px; height:35px">
				      	 <option value =<c:out value="${ri.riderStatus}"/> ><c:out value="${ri.riderStatus}"/></option>
				      	 <option value="available">available</option>
				      	 <option value="unavailable">unavailable</option>
				      </select>
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