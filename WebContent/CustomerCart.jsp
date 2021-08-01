<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="foxtrot.model.*,foxtrot.dao.*,java.sql.*,java.util.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<% List<OrderMenu> omA = (List<OrderMenu>) session.getAttribute("cart"); %>

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

<!-- TABLE CUST BOOTSTRAP -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/sideBar.css">

<link rel="stylesheet" href="css/FcustTable.css">

<title>Cart</title>
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
	  <div class="container-fluid"><h4>- Cart Section -</h4><hr></div>
	  
	  <div id="trainings_blog" class="layout_padding" style="background: #FFFFFF; width:98%">
      <div class="limiter">
	  <div class="container-table100">
      <div class="wrap-table100">
	  <div class="table100 ver2 m-b-110">

	  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Current date & Time : <%= (new java.util.Date()).toLocaleString()%></b><br>
		<form action="CustomerAddOrderServlet" method="post">
		<input type="hidden" name="custEmail" value="<%= session.getAttribute("CurrentSessionUser") %>" />

		<!-- TABLE -->		
		<div class="container"><div class="table-wrapper">
        <div class="table-title"></div>
        
        <table class="table table-bordered">
        <thead><tr style=text-align:center>
               <th>ID</th>
			   <th>Name</th>
			   <th>Quantity</th>
			   <th>Price</th>
			   <th>Action</th>
        </tr></thead>
        
        <tbody>
		<% if (omA == null) 
		{%> <tr class="active-row">
	        <td colspan="5" align="center">No order yet!</td></tr>
        <%}
           else {
				 double total = 0;
				 for (int i = 0 ; i < omA.size() ; i++)
					{
					 OrderMenu o = omA.get(i);
		%>
						
		<tr class="active-row" style=text-align:center>						     		
			<td> <%= o.getMenuid() %></td>
			<td><%= o.getMenuName() %></td>
			<td><%= o.getQuantity() %></td>
			<td>RM <%= o.getMenuPrice() %></td>
			<td><a href="CustRemoveCartServlet?menuid=<%=i%>" rel="tooltip" class="w3-btn w3-red w3-round-large">Remove</a></td>
		</tr>
						
		<%
		 total += o.getMenuPrice();
		 o.setTotalPrice(total);
		 System.out.println("Total Price In Cart : " +o.getTotalPrice());
		 %>
											
		<%}%>
						
		<tr class="active-row">
			<td colspan = 5 align = "right">
			<input type="hidden" name="orderTotalPrice" value="<%=total%>"> Total Price : RM<%= total%>  
			<br><br><a href="CustomerListMenuServlet"><button type="button" class="btn btn-default">Add More</button></a>&nbsp;&nbsp;<button type="submit" class="btn btn-default">Checkout</button></td>
		</tr> 
						     	
		<%System.out.println("Total Price : " + total);%> 
		
        </tbody>
        </table>
        <%} %>
        
        </div></div>     		
		</form>
		
		</div></div></div></div></div>
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