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
	if(session.getAttribute("CurrentSessionUser")==null) response.sendRedirect("StaffLogin.jsp");
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

  <title> Profile </title>

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
          <a class="navbar-brand" href="StaffPage.jsp">
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
                <a class="nav-link" href="StaffViewOrderListServlet">Order</a>
              </li>
              <li class="nav-item">
              <a class="nav-link">_________________________<span class="sr-only">(current)</span> </a>
              </li>
            </ul>
            
            <div class="user_option">
              <a href="StaffProfileServlet?staffid=<%=session.getAttribute("CurrentSessionUser") %>" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
                <span>Welcome, <%=session.getAttribute("SessionCategory")%>!</span>
              </a>
              <a href="StaffLogoutServlet" class="order_online">
                Logout
              </a>
            </div>
            
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- Receipt section -->
  
  <div id="trainings_blog" class="layout_padding" style="background: #FFFFFF; margin-left:auto; margin-right:auto; width:60%">
  <div class="limiter"><div class="container-table100"><div class="wrap-table100"><div class="table100 ver2 m-b-110">

	<!-- ORDER DETAILS TEMPLATE -->
	<div><div class="purchase overflow-auto">
	<main>
	    <div><h5><b>User Profile</b></h5></div><br>
	    
	    <div class="col-md-8"><div class="card mb-3"><div class="card-body">
	    
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Staff ID</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${st.staffid}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Name</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${st.staffName}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Password</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${st.staffPassword}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Contact No</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${st.staffPhone}"/></div></div>
	    <hr>
	    <div class="row"><div class="col-sm-3"><b class="mb-0">Category</b></div>
	    <div class="col-sm-9 text-secondary"><c:out value="${st.staffCategory}"/></div></div>
	    <hr>
	    <div class="row">
	      <div class="col-sm-12"> 
	        <a href="StaffUpdateDetailServlet?staffid=<c:out value="${st.staffid}" />"><button type="button" class="btn-box">Edit</button></a>		<!-- update button style -->
	      </div>
	    </div>
	    </div></div>

	    </div>
		
	  </main>
	  <!-- page-content" -->
	</div></div></div></div></div></div></div>

  <!-- end Receipt section -->

  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="">Foxtrot Corporation</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By
          <a href="https://themewagon.com/" target="_blank">ThemeWagon</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By
          <a href="https://html.design/" target="_blank">Free Html Templates</a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

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