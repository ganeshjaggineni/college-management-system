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


//@WebServlet("/LoginAllServ")
public class LoginAllServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter printer=response.getWriter();
		response.setContentType("text/html");
		
		String url="jdbc:mysql://localhost:3306/college";
		String mysqluser="root";
		String mysqlpwd="GANESHgani123#@mysql";
		
		//getting login details from the form
		String username=request.getParameter("user");
		String userpwd=request.getParameter("pwd");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
            PreparedStatement ps = con.prepareStatement("select * from STULOGIN where StuRegNo=? and StuPwd=?");
            ps.setString(1, username);
            ps.setString(2, userpwd);
            
            PreparedStatement tps=con.prepareStatement("select * from EMPLOGIN where EmpId=? and EmpPwd=?");
            tps.setString(1,username);
            tps.setString(2, userpwd);
            ResultSet rs =ps.executeQuery();
            

            ResultSet trs=tps.executeQuery();
           
           
            if(rs.next())
            {

    			printer.println("<h2>"+"data Registered successfully"+"</h2>");
    			request.setAttribute("userid", username);
    			RequestDispatcher rd=request.getRequestDispatcher("UserDashboard.jsp");
    		rd.forward(request, response);
            }
            else if(trs.next())
            {
            	request.setAttribute("userid", username);
            	RequestDispatcher rd=request.getRequestDispatcher("employeedashboard.jsp");
        		rd.forward(request, response);
            }
            else if(username.equals("admin")&&userpwd.equals("admin"))
            {
            	RequestDispatcher rd=request.getRequestDispatcher("adminindex.jsp");
        		rd.forward(request, response);
            }
            else
            {
            	RequestDispatcher rd=request.getRequestDispatcher("login.html");
        		rd.forward(request, response);
            }
			
           
			
	
		}		
		
		catch(Exception e)
		{
			System.out.println(e);
			
			
		}
	}

}
