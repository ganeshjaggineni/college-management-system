package org;
import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.*;


public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String url="jdbc:mysql://localhost:3306/college";
		String mysqluser="root";
		String mysqlpwd="GANESHgani123#@mysql";
		String username=request.getParameter("name");
		String userpassword=request.getParameter("password");		
		int flag=0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
//			out.println("succesfully connected");
//			out.println("user"+username+"pass"+userpassword);/
//			out.println(con);
			String query="SELECT * FROM STUREGISTRATION WHERE StuRegNO=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, username);
			ResultSet res=pst.executeQuery();
			
			if(res.next())
			{
				
				RequestDispatcher rd=request.getRequestDispatcher("dummyuserdashboard.html");
				rd.include(request, response);
				
				out.println("<div class='emi'>");
				out.println("<h2>");
				out.println(res.getString(1));
				out.println("</h2>");
				out.println("</div>");
				
				out.println("<table>");
				out.println("<tr>");
				out.println("<td>");
				out.println("username");
				out.println(res.getString(2));
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				
			}
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	

}
