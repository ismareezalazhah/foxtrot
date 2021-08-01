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
<!-- MENU BOOTSTRAP -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/sideBar.css">

<link rel="stylesheet" href="css/Fmenu.css">

<title>Menu List</title>
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
	  
	  <div id="trainings_blog" class="layout_padding" style="background: #FFFFFF; width:90%; margin-left:auto; margin-right:auto">
	  <div class="limiter">
	  <div class="container-table100">
	  <div class="wrap-table100">
	  <div class="table100 ver2 m-b-110">
		
		
	    <div class="container"><div class="row"><div class="col-lg-12">
		<div class="page_title text-center mb-4">
		<h1>our menu</h1><div class="single_line"></div>
		</div>
		</div></div>

			<div class="row">
				<div class="tab-content col-lg-12" id="myTabContent">
				<div class="tab-pane fade show active" id="breakfast" role="tabpanel" aria-labelledby="breakfast-tab">
				<div class="row">
				<c:forEach items="${menu}" var="m">
						<div class="col-md-6">
						<div class="single_menu">
						<c:out value="${m.menuImage}"/><img src="data:image/jpg;base64,${m.base64Image}" width="90" height="90"/>
						<div class="menu_content">
						<h4><c:out value="${m.menuName}"/><span>RM <c:out value="${m.menuPrice}"/></span></h4>
						<p><c:out value="${m.menuDesc}"/></p>
						<a href="CustomerAddCart?action=addtocart&menuid=<c:out value="${m.menuid}" />"><button type="button" class="view">Add To Cart</button></a>
						</div></div>	
						</div>
			    </c:forEach>
				</div>
				</div>
				</div>
			</div>
			
		<!-- Unavailable Menu Content -->
			
		<div class="page_title text-center mb-4"><h1>Unavailable Items</h1><div class="single_line"></div></div>
		<div class="row">
				<div class="tab-content col-lg-12" id="myTabContent">
				<div class="tab-pane fade show active" id="breakfast" role="tabpanel" aria-labelledby="breakfast-tab">
				<div class="row">
				<c:forEach items="${menu2}" var="m2">
						<div class="col-md-6">
						<div class="single_menu">
						<c:out value="${m2.menuImage}"/><img src="data:image/jpg;base64,${m2.base64Image}" width="90" height="90"/>
						<div class="menu_content">
						<h4><c:out value="${m2.menuName}"/><span>RM <c:out value="${m2.menuPrice}"/></span></h4>
						<p><c:out value="${m2.menuDesc}"/></p>
						<button type="button" class="view">Currently Unavailable</button>
		   				</div></div>	
						</div>
			    </c:forEach>
				</div>
				</div>
				</div>
		</div>

		</div>
	
	</div></div></div></div></div><br><br><br><br><br><br>

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