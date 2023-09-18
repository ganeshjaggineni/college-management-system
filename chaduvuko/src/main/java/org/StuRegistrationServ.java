package org;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


@WebServlet("/StuRegistrationServ")
public class StuRegistrationServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter printer=response.getWriter();
		response.setContentType("text/html");
		
		String url="jdbc:mysql://localhost:3306/college";
		String mysqluser="root";
		String mysqlpwd="GANESHgani123#@mysql";
		
		//getting student details from the form
		String studregno=request.getParameter("sturegno");
		String studpwd=request.getParameter("stupwd");
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
		
		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
//			printer.println("succesfully connected");
			String stuinsquery="INSERT INTO STUREGISTRATION values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(stuinsquery);
			
			
//			printer.println(studregno);
//			printer.println(studpwd);
//			printer.println(studbranch);
//			printer.println(studyear);
//			printer.println(studsem);
//			printer.println(studname);
//			printer.println(studgender);
//			printer.println(studdob);
//			printer.println(studmothername);
//			printer.println(studfathername);
//			printer.println(studaddress);
//			printer.println(studmobile);
//			printer.println(studparmobile);
//			printer.println(studaadhar);
//			printer.println(studemail);
			
//			storing from values to database
			
			pst.setString(1, studregno);
			pst.setString(2, studname);
			pst.setString(3, studgender);
			pst.setString(4, studdob);
			pst.setInt(5, studyear);
			pst.setInt(6, studsem);
			pst.setString(7, studbranch);
			pst.setString(8, studmothername);
			pst.setString(9, studfathername);
			pst.setString(10, studmobile);
			pst.setString(11, studparmobile);
			pst.setString(12, studaadhar);
			pst.setString(13, studemail);
			pst.setString(14, studaddress);
			pst.setString(15, studjoindate);
			pst.setString(16, studeamcetht);
			pst.setString(17, studeamcetrank);
			pst.setString(18, studinterclg);
			
			
			
			int rows=pst.executeUpdate();
			
			
//			String stuinsloginquery="INSERT INto DUMMYLOGIN VALUES(?,?)";
//			PreparedStatement ps=con.prepareStatement(stuinsloginquery);
//			int s=ps.executeUpdate();
//			ps.setString(1,studregno);
//			ps.setString(2, studpwd);
//			String que="INSERT INTO DUMMYLOGIN values(''+"studregno"+'',"studpwd")";
//			Statement st=con.createStatement();
//			int s=st.executeUpdate(que);
			String query="INSERT INTO STULOGIN values(?,?)";
			PreparedStatement psk=con.prepareStatement(query);
			
			psk.setString(1, studregno);
			psk.setString(2, studpwd);
			int ro=psk.executeUpdate();
//			printer.println("<h3>login success</h3>");
			
			if(rows>0)
			{
//			printer.println(rows+"rows effected");
			printer.println("<div class='servmsg'>");
			printer.println("<h2>"+"data Registered successfully"+"</h2>");
			printer.println("</div>");
			RequestDispatcher rd=request.getRequestDispatcher("sturegistration.html");
			rd.include(request, response);
			}
			else
			{
				printer.println("<div class='servmsg'>");
				printer.println("<h2 style='color:red'>"+"Registration failed"+"</h2>");
				printer.println("</div>");
				RequestDispatcher rd=request.getRequestDispatcher("sturegistration.html");
				rd.include(request, response);
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			printer.println("<div class='servmsgerr'>");
			printer.println("<h2 style='color:red'>"+e.getMessage()+"</h2>");
			printer.println("<div class='dbmsg'>");
			printer.println("<h2 style='color:red'>"+"Registration failed"+"</h2>");
			printer.println("</div>");
			printer.println("</div>");
			RequestDispatcher rd=request.getRequestDispatcher("sturegistration.html");
			rd.include(request, response);
			
			
		}
	}

}
