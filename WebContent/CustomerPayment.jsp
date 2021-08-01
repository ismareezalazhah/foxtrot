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
<!-- PAYMENT BOOTSTRAP -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/pay.css">
<!-- PAYMENT BOOTSTRAP -->
<link rel="stylesheet" href="css/sideBar.css">
<link rel="stylesheet" href="css/BackgroundBody.css">

<title>Payment</title>
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
	  <div class="container-fluid"><h4>- Payment Section -</h4><hr></div>
	  
	    
		<!-- NEW PAYMENT FORM -->
			
		<div class="container">
	    	<div class="row">
				<div class="col-md-6 col-md-offset-3"><div class="panel panel-login">
					<div class="panel-heading">
					<div class="row">
					<div class="col-xs-6"><a href="#" class="active" id="login-form-link">Online Banking</a></div>
					<div class="col-xs-6"><a href="#" id="register-form-link">Credit/Debit</a></div>
					</div><hr>
					</div>
						
		<div class="panel-body"><div class="row"><div class="col-lg-12">
								
		<!-- 1st Panel -->
			<form id="login-form" action="CustomerPaymentServlet" method="post" role="form" style="display: block;">
				<label>Payment Method</label>
				<div class="form-group"><input type="text" name="paymentType" class="form-control" value="OnlineBanking" readonly/></div>
				<label>Select Bank </label>
										
				<div class="form-group"><select name="bankName" style="width:400px; height:35px">
				<option value="Maybank">Maybank</option>
				<option value="CIMB">CIMB</option>
				<option value="Bank Islam">Bank Islam</option>
				<option value="BSN">BSN</option>
				</select></div>
				<br>
				
				<div class="form-group"><div class="row"><div class="col-sm-6 col-sm-offset-3">
					<input type="submit" class="form-control btn btn-login">
				</div></div></div>
			</form>
									
		<!-- 2nd Panel -->
			<form id="register-form" action="CustomerPaymentServlet" method="post" role="form" style="display: none;">
				<label>Payment Method</label>
				<div class="form-group"><input type="text" name="paymentType" class="form-control" value="Card" readonly/></div>
				<label>Card Holder Name</label>
				<div class="form-group"><input type="text" name="cardHolderName" class="form-control" value=""></div>
										
				<label>Select Bank</label>
				<div class="form-group"><select name="bankName" style="width:400px; height:35px">
				<option value="Maybank">Maybank</option>
				<option value="CIMB">CIMB</option>
				<option value="Bank Islam">Bank Islam</option>
				<option value="BSN">BSN</option>
				</select></div>
										
				<label>Card Type</label>
				<div class="form-group"><select name="cardType" style="width:400px; height:35px">
				<option value="credit">Credit Card</option>
				<option value="debit">Debit Card</option>
				</select></div>
										
				<label>Card Number</label>
				<div class="form-group"><input type="text" name="cardNum" class="form-control" value=""></div>
				<label>Cvv</label>
				<div class="form-group"><input type="text" name="cardCvv" class="form-control" value=""></div>
										
				<div class="form-group">
					<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
					<input type="submit" class="form-control btn btn-login">
					</div>
					</div>
				</div>
			</form>
									
		</div></div></div>
	</div></div></div></div>

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

<script>
$(function() {

    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
</script>
</html>