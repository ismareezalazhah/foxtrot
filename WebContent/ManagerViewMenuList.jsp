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
<meta name="viewport" content="width=device-width, initial-scale=1">

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


<title>Menu Directory</title>
</head>
<body  style="background-color:#f5deb3;">

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
		  
		  <li><a href="StaffLogoutServlet"><i class="fa fa-sign-out-alt"></i><span>Logout</span></a></li></ul>
		</div></div>
	  </nav>
	  
	  <!-- MAIN CONTENT -->
	  <main class="page-content">
		<div class="container-fluid"><h4>Menu Directory</h4><hr></div>

		<div id="trainings_blog" class="layout_padding" style="background: #FFFFFF; width:98%">
		  <div class="limiter">
		  <div class="container-table100">
		  <div class="wrap-table100">
		  <div class="table100 ver2 m-b-110">
		  
		  <!--- TABLE --->
		  <div class="container">
		  <input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search based on Menu name" title="Type in a name">
			  <br>
			  <table class="table table-bordered table-striped">
			    <thead><tr>
			        <th>Menu ID</th>
			        <th>Name</th>
			        <th>Description</th>
			        <th>Price</th>
			        <th>Image</th>
				    <th>Status</th>
				    <th>Action</th>
			    </tr></thead>
			    
			    <tbody id="myTable">
			    		<c:forEach items="${Mmenu}" var="mm">

				 		<tr class="active-row" style=text-align:center>	
							<td><c:out value="${mm.menuid}"/></td>
							<td><c:out value="${mm.menuName}"/></td> 		
				 			<td><c:out value="${mm.menuDesc}"/></td>
				 			<td>RM <c:out value="${mm.menuPrice}"/></td>
				 			<td><c:out value="${mm.menuImage}"/><img src="data:image/jpg;base64,${mm.base64Image}" width="90" height="90"/></td> <!-- if error something here I dont know -->
				 			<td><c:out value="${mm.menuStatus}"/></td>
				 			<td><a href="UpdateMenuServlet?menuid=<c:out value="${mm.menuid}" />"><button type="button" class="view">Update</button></a></td>
				 		</tr>
			    		</c:forEach>
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

<script>
function myFunction() {
	var input, filter, table, tr, td, i, txtValue;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable");
	tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
			    txtValue = td.textContent || td.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
			    tr[i].style.display = "";
			    } else {
			        tr[i].style.display = "none";
			      }
			    }       
			  }
			}
</script>

</html>