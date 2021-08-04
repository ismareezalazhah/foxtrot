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
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- NAVBAR BOOTSTRAP -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<!-- TABLE BOOTSTRAP -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/sideBar.css">
<link rel="stylesheet" href="css/BackgroundBody.css">
<title>List Customer</title>
<style>
</style>
</head>
<script>
window.onload = function() {
    var request = new XMLHttpRequest();
    request.open("GET", "https://mikroservis-01.herokuapp.com/", true);
    request.onload = function() {
        var customer = JSON.parse(this.response);
        var col = [];
        for (var i = 0; i < customer.length; i++) {
            for (var key in customer[i]) {
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
        }

        // CREATE DYNAMIC TABLE.
        var table = document.createElement("table");

        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1);                   // TABLE ROW.

        for (var i = 0; i < col.length; i++) {
            tr.appendChild(th);
        }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < customer.length; i++) {

            tr = table.insertRow(-1);

            for (var j = 0; j < col.length; j++) {
			var tabCell = tr.insertCell(-1);
               tabCell.innerHTML = customer[i][col[j]];
            }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);
    }
    request.send();
    }
</script>
<body style="background-color:#f5deb3;">

	<!-- SIDENAVBAR-->
	
	<div class="page-wrapper chiller-theme toggled">
	  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#"><i class="fas fa-bars"></i></a>
	  <nav id="sidebar" class="sidebar-wrapper">
	    <div class="sidebar-content">
	    <div class="sidebar-brand"><a href="ManagerPage.jsp">FOXTROT</a><div id="close-sidebar"><i class="fas fa-times"></i></div></div>
	      
	    <div class="sidebar-header">
	       <div class="user-pic"><img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="User picture"></div>
	       <div class="user-info"><span class="user-role">Welcome, <%=session.getAttribute("SessionCategory")%>!</span></div>
	    </div>

		<!-- sidebar-search  -->
		<div class="sidebar-menu">
		<ul>
		  <li><a href="ManagerProfileServlet?staffid=<%=session.getAttribute("CurrentSessionUser") %>"><i class="fa fa-address-card"></i><span>Profile</span></a></li>
		  <li class="sidebar-dropdown"><a href="#"><i class="fa fa-shopping-cart"></i><span>Orders Management</span></a>      
			  <div class="sidebar-submenu">
			  	<ul>
			   	<li><a href="ManagerViewOrderListServlet">Available Order</a></li>
			    <li><a href="ManagerViewOrderHistoryListServlet">Order History</a></li>
				</ul></div>
		  </li>
	
		  <li class="sidebar-dropdown">
		  <a href="#"><i class="fa fa-user"></i><span>Staff Management</span></a>
		     <div class="sidebar-submenu">
		     <ul>
		     <li><a href="ManagerViewStaffListServlet">Staff Directory</a></li>
		     <li><a href="ManagerAddStaff.jsp">New Staff</a></li>
		     <li><a href="ManagerViewRiderListServlet">Rider Directory</a></li>
		     <li><a href="ManagerAddRider.jsp">New Rider</a></li>
			 </ul></div>
		  </li>
		          
		  <li class="sidebar-dropdown">
		  <a href="#"><i class="fa fa-utensils"></i><span>Restaurant Menu</span></a>
		     <div class="sidebar-submenu">
		     <ul>
		     <li><a href="ManagerViewMenuListServlet">Menu Directory</a></li>
		     <li><a href="ManagerAddMenu.jsp">New Menu</a></li>
			 </ul></div>
		  </li>
		  
		  <li class="sidebar-dropdown">
		  <a href="#"><i class="fa fa-user"></i><span>Customer Management</span></a>
		     <div class="sidebar-submenu">
		     <ul>
		     <li><a href="listCustomerMicroservice.jsp">Customer Directory</a></li>
			 </ul></div>
		  </li>
		  
		  <li><a href="StaffLogoutServlet"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li></ul>
 
		</div></div>
	  </nav>
	  
	  <!-- MAIN CONTENT -->
	  <main class="page-content">
		<div class="container-fluid"><h4>Customer Directory</h4><hr></div>

	  <div id="trainings_blog" class="layout_padding" style="background: #FFFFFF; width:98%">
	  <div class="limiter">
	  <div class="container-table100">
	  <div class="wrap-table100">
	  <div class="table100 ver2 m-b-110">
	  
	  <!--- TABLE --->
	  <div class="container">
		  <br>
		  <table class="table table-bordered table-striped">
		    <tbody id="myTable">
		     <tr class="active-row">	
		     <td id="showData"></td>
			    </tr>
		    </tbody>
		  </table>

		</div>
		
		</div></div></div></div></div><br><br><br><br>

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
