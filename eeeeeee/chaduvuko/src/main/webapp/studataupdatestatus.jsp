<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<%String userid = session.getAttribute("userId").toString(); %>
<h2>hai</h2>
<%
String url="jdbc:mysql://localhost:3306/college";
String mysqluser="root";
String mysqlpwd="GANESHgani123#@mysql";

		
	    String studbranch=request.getParameter("branch");
		int studyear=Integer.parseInt(request.getParameter("stuyear"));
		int studsem=Integer.parseInt(request.getParameter("stusem"));
		String studname=request.getParameter("stuname");
		String studgender=request.getParameter("stugender");
		String studdob=request.getParameter("studob");
		String studmothername=request.getParameter("stumothername");
		String studfathername=request.getParameter("stufathername");
		String studaddress=request.getParameter("stuaddress");
		String studmobile=request.getParameter("stumobile");
		String studparmobile=request.getParameter("stuparmobile");
		String studaadhar=request.getParameter("stuaadhar");
		String studemail=request.getParameter("stuemail");
		String studjoindate=request.getParameter("stujoindate");
		String studeamcetht=request.getParameter("stueamcetht");
		String studeamcetrank=request.getParameter("stueamcetrank");
		String studinterclg=request.getParameter("stuinterclg");
		
	
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
		 String queryy="UPDATE STUREGISTRATION Set StuName=?,StuGender=?,StuDob=?,AcademicYear=?,StuAcademicSem=?,StuBranch=?,StuMotherName=?,StuFatherName=?,StuMobile=?,StuParMobile=?,StuAadhar=?,StuEmail=?,StuAddress=?,StuJoinDate=?,StuEamcetHt=?,StuEamcetRank=?,StuInterClg=? where StuRegNo=?";
			PreparedStatement ps=con.prepareStatement(queryy);
			
			ps.setString(1, studname);
			ps.setString(2, studgender);
			ps.setString(3, studdob);
			ps.setInt(4, studyear);
			ps.setInt(5, studsem);
			ps.setString(6, studbranch);
			ps.setString(7, studmothername);
			ps.setString(8, studfathername);
			ps.setString(9, studmobile);
			ps.setString(10, studparmobile);
			ps.setString(11, studaadhar);
			ps.setString(12, studemail);
			ps.setString(13, studaddress);
			ps.setString(14, studjoindate);
			ps.setString(15, studeamcetht);
			ps.setString(16, studeamcetrank);
			ps.setString(17, studinterclg);
			ps.setString(18, userid);
		
			int rs =ps.executeUpdate();
			
			if(rs>0){%>
			<% 
			session.setAttribute("mesg","data");
			response.sendRedirect("UpdateStudentData.jsp");%>
			
		 <% }else{ %> 
			
	
			<% }%>
			<%}catch(Exception e)
		{ 
			System.out.println(e);
		}
			%>
			
			
	
		
</body>

</html>