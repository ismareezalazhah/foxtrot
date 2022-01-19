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

  <title> Payment Page </title>

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

	<link rel="stylesheet" type="text/css" href="css/payment.css" />
	
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
          Payment Gateway
        </h2>
      </div><br><br>

<!-- Payment section -->
  <div class="wrapper">
      <div class="form-container">
        <div class="slide-controls">
          <input type="radio" name="slide" id="login" checked>
          <input type="radio" name="slide" id="signup">
          <label for="login" class="slide login">Online Banking</label>
          <label for="signup" class="slide signup">Credit/Debit</label>
          <div class="slider-tab"></div>
        </div>
        <div class="form-inner">
<!-- 1st type section -->
          <form action="CustomerPaymentServlet" class="login" method="post">
            <br>
            <label>Payment Method</label>
              <div>
                <input type="text" name="paymentType" class="form-control" value="OnlineBanking" readonly/>
              </div><br>
            <label>Select Bank </label>
              <div>
                <select class="form-control nice-select wide" name="bankName" style="width:400px; height:35px">
                  <option value="Maybank">Maybank</option>
				  <option value="CIMB">CIMB</option>
				  <option value="Bank Islam">Bank Islam</option>
				  <option value="BSN">BSN</option>
                </select>
              </div><br>

            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="Submit">
            </div>
          </form>
          
<!-- 2nd type section -->          
          <form action="CustomerPaymentServlet" class="signup" method="post">
          <br>
            <label>Payment Method</label>
              <div>
                <input type="text" name="paymentType"  required="required" class="form-control" value="Card" readonly/>
              </div><br>
            <label>Card Holder Name</label>
              <div>
                <input type="text" name="cardHolderName"  required="required" class="form-control" value="">
              </div><br>
              
            <label>Select Bank </label>
              <div>
                <select class="form-control nice-select wide" name="bankName" style="width:400px; height:35px">
                  <option value="Maybank">Maybank</option>
				  <option value="CIMB">CIMB</option>
				  <option value="Bank Islam">Bank Islam</option>
				  <option value="BSN">BSN</option>
                </select>
              </div><br>
              
            <label>Card Type </label>
              <div>
                <select class="form-control nice-select wide" name="cardType" style="width:400px; height:35px">
                  <option value="credit">Credit Card</option>
				  <option value="debit">Debit Card</option>
                </select>
              </div><br>
              
            <label>Card Number</label>
              <div>
                <input type="text" name="cardNum"  required="required" class="form-control" value="">
              </div><br>
            <label>Cvv</label>
              <div>
                <input type="text" name="cardCvv"  required="required" class="form-control" value="">
              </div><br>
                 
            <div class="field btn">
              <div class="btn-layer"></div>
              <input type="submit" value="Submit">
            </div>
          </form>
        </div>
      </div>
    </div>

  <!-- end Register section -->
    
    
    
    
    
    </div>
		<br><br><br>
  </section>

  <!-- end table section -->

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
  <!-- End footer section -->

	<script>
	const loginText = document.querySelector(".title-text .login");
	const loginForm = document.querySelector("form.login");
	const loginBtn = document.querySelector("label.login");
	const signupBtn = document.querySelector("label.signup");
	const signupLink = document.querySelector("form .signup-link a");
	signupBtn.onclick = (()=>{
	  loginForm.style.marginLeft = "-50%";
	  loginText.style.marginLeft = "-50%";
	});
	loginBtn.onclick = (()=>{
	  loginForm.style.marginLeft = "0%";
	  loginText.style.marginLeft = "0%";
	});
	signupLink.onclick = (()=>{
	  signupBtn.click();
	  return false;
	});
	</script>
	
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
