<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Student Data</title>
<link rel="stylesheet" href="deletestudentstyle.css">
</head>
<body>
	<div class="updatecontainer">
		<marquee scrollamount="15"><h1>Be carefull while Deleting</h1></marquee>
		<div class="updatebox">
			<div class="updatehead">
				<h2>Delete Student Data</h2>
			</div>
			<div class="box">
			    <form id="my_form" action="DeleteStudent.jsp" method="POST">
                <label>Enter Student Registration No:</label>
                <input type="text" name="delid" placeholder="Student Registration No :">
                <div class="butt" >
					<div id="app-cover" >
						<input type="checkbox" id="checkbox" onclick="submit_form()" >
						<div id="bin-icon" >
						  <div id="lid" ></div>
						  <div id="box" >
							<div id="box-inner" >
							  <div id="bin-lines" ></div>
							</div>
						  </div>
						</div>
						<div id="layer" ></div>
					  </div>
					 
            </div>
             </form>
			</div>
		</div>
	</div>
	
	<%!
	String url="jdbc:mysql://localhost:3306/college";
	String mysqluser="root";
	String mysqlpwd="GANESHgani123#@mysql";
	
	%>
	<%
	String useid=request.getParameter("delid");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
	String studelquery="DELETE FROM STULOGIN WHERE StuRegNo=?";
	PreparedStatement del=con.prepareStatement(studelquery);
	del.setString(1,useid);
	int rows=del.executeUpdate();
	
	if(rows>0)
	{
		String studeletequery="DELETE FROM STUREGISTRATION WHERE StuRegNo=?";
		PreparedStatement delete=con.prepareStatement(studeletequery);
		delete.setString(1,useid);
		int delrows=delete.executeUpdate();
		if(delrows>0)
		{%>
			
				<div class="ser">
		<h3>Deleted Sucessfully</h3>
		</div>
			<%} %>
		<% }%>
			

	
	

	
	
	
	
	<script>
    function submit_form(){
        var form = document.getElementById("my_form");
        form.submit();
        alert("Your Message Sent");
    }
    </script>
</body>
</html>