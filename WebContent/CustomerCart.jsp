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
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> Order Page </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

  	<!-- TABLE BOOTSTRAP -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="CustomerPage.jsp">
            <span>
              Warung D'Tebing
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item ">
                <a class="nav-link" href="CustomerListMenuServlet">Menu </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="CustomerListOrderServlet">Order</a>
              </li>
              <li class="nav-item active ">
                <a class="nav-link" href="CustomerCart.jsp">Cart  <span class="sr-only">(current)</span></a>
              </li>
            </ul>
            <div class="user_option">
              <a href="CustomerProfileServlet?custEmail=<%=session.getAttribute("CurrentSessionUser") %>" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
                <span>Welcome, <%=session.getAttribute("CurrentSessionUser")%>!</span>
              </a>
              <a href="CustomerLogoutServlet" class="order_online">
                Logout
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>


  <!-- Table section -->
  <section class="food_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Shopping Cart
        </h2><br><br>
      </div>

     <div class="container-table100">
	 <div class="wrap-table100">
	 <div class="table100 ver2 m-b-110">
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Current date & Time : <%= (new java.util.Date()).toLocaleString()%></b><br><br>
		
		<form action="CustomerAddOrderServlet" method="post">
		<input type="hidden" name="custEmail" value="<%= session.getAttribute("CurrentSessionUser") %>" />
		
		<!-- TABLE -->		
	  <div class="container"><div class="table-wrapper">
		  <table class="table table-bordered">
		    <thead><tr style=text-align:center>
			       <th>ID</th>
				   <th>Name</th>
				   <th>Quantity</th>
				   <th>Price</th>
				   <th>Action</th>
		    	   </tr>
		   </thead>
		    
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
		
		</div></div></div></div>
		<br><br><br>
  </section>
  
  <!-- end table section -->


  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>


</html>
