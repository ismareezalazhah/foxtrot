<link rel="stylesheet" href="css/style.css"/>
<script>
function updateFunction() {
	alert("Update Successfully");
	}
</script>
<%@page import="java.sql.*"%>
<%@ include file="header.html"%>
	<%
	String id = request.getParameter("id");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_82bd4eac5871c46";
	String userid = "b83c5dac6a4a40";
	String password = "1bbc4399";
	
	try {
	Class.forName(driver);
	} 
	catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>
	<%
	try{
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql ="select * from staff where staff_id="+id;
	resultSet = statement.executeQuery(sql);
	
	while(resultSet.next()){
	%>
	
	<!DOCTYPE html>
	<style>
	label {
   	width: 100px;
   	display: inline-block;
   	text-align: left;
	}
</style>
	<html>
	<body class="u-body">
    		<section class="u-clearfix u-grey-90 u-section-1" id="sec-1dd5">
     	 		<div class="u-clearfix u-sheet u-sheet-1">
        		<br><br>
        		<div class="container">
	<form method="post" action="updateProcess.jsp">
		<div class="header">
			<h3 style="text-align:center;">UPDATE STAFF DETAILS</h3>									
		</div>
	<div class="sep"></div>

	<div class="inputs">
	<center>
	<input type="hidden" name="staff_id" value="<%=resultSet.getString("staff_id") %>">
		<label>STAFF ID: </label>
	<input type="text" name="staff_id" value="<%=resultSet.getString("staff_id") %>" disabled>
	<br><br>
	<label>NAME: </label>
	<input type="text" name="staff_name" value="<%=resultSet.getString("staff_name") %>" required>
	<br><br>
	<label>GENDER: </label>
	<input type="text" name="staff_gender" value="<%=resultSet.getString("staff_gender") %>" required>
	<br><br>
	<label>ADDRESS: </label>
	<input type="text" name="staff_address" value="<%=resultSet.getString("staff_address") %>" required>
	<br><br>
	<label>P.NUMBER: </label>
	<input type="text" name="staff_phone" value="<%=resultSet.getString("staff_phone") %>" required>
	<br><br>
	<label>CATEGORY: </label>
	<input type="text" name="staff_category" value="<%=resultSet.getString("staff_category") %>" required>
	<br><br>
	<input onClick="updateFunction()" type="submit" value="submit">
		</center>				
	</div>
	</form>
	 </section>
	<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</body>
	</html>
