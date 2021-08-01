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



<title>Order Details</title>
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
	  <div class="container-fluid"><h4>- Order Details -</h4><hr></div>
		
	  <div id="trainings_blog" class="layout_padding" style="background: #FFFFFF; margin-left:auto; margin-right:auto; width:85%">
	  <div class="limiter"><div class="container-table100"><div class="wrap-table100"><div class="table100 ver2 m-b-110">

		<!-- ORDER DETAILS TEMPLATE -->
		<div><div class="purchase overflow-auto">
	    <main>
	    
	    <div class="row">

	    	<div style="margin-left:auto; margin-right:auto;">
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/logo.png" width="80px" height="80px"><br>
	    	<b>Afmar Trading And Services</b><br>&nbsp;
	    	<b>Warung D'Tebing Receipt</b></div>
	    </div><br><br>
	    
	                
	    <div class="row"><div class="col-sm-12 col-xs-12 table-responsive">
	    
	    <table class="table table-condensed" border="0" cellspacing="0" cellpadding="0" width="100%">
	    <thead><tr>
	        <th class="text-center col-xs-1 col-sm-1">Menu ID</th>
	        <th class="text-center col-xs-7 col-sm-7">Menu Name</th>
	        <th class="text-center col-xs-1 col-sm-1"></th>
	        <th class="text-center col-xs-3 col-sm-3">Price (RM)</th>
	    </tr></thead>
	    
	    <tbody>
	    <c:forEach items="${custorder}" var="odl">
	        <tr>
	        <td class="col-xs-1 col-sm-1 text-center"><c:out value="${odl.menuid}"/></td>
	        <td class="text-center"><c:out value="${odl.menuName}"/></td>
	        <td></td>
	        <td class="text-center">RM <c:out value="${odl.menuPrice}"/></td>
	        </tr> 
	    </c:forEach>   
	    </tbody>
	    
	    </table><hr><br>
	    </div></div>
	    
	    
	    <div><h5><b>Order Details</b></h5></div><br>
	    
	    <div class="col-md-8"><div class="card mb-3"><div class="card-body">
	    
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Order ID</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${od.orderid}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Date</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${od.orderDate}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Progress</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${od.orderProgress}"/></div></div>
	    <hr>
		<div class="row"><div class="col-sm-3"><b class="mb-0">Customer Name</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${cs.custName}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Address</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${cs.custAddress}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Contact No.</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${cs.custPhone}"/></div></div>
	    <hr>

	    </div></div>
	    </div>
	    
	    <div class="col-md-8"><div class="card mb-3"><div class="card-body">
	    
	    <form action="RiderUpdateProgressServlet" method="post">
	    
	    <input type="hidden" name="orderid" value="<c:out value="${od.orderid}"/>"/>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Update Order Progress</b></div>
	    
	    <select name="orderProgress" style="width:200px; height:35px">
	    <option value = "Pickup">Pickup</option>
	    <option value = "Complete">Complete</option>
	    </select>
	    
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <button type="submit" class="btn btn-default">Update</button></div>
	    </form>
	    <hr>

	    </div></div></div>
	    
	    
	    </main>
	    </div></div>
	    
		</div></div></div></div></div><br><br><br><br><br><br><br><br>	



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