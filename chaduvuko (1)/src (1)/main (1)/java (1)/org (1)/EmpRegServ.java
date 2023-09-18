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

/**
 * Servlet implementation class EmpRegServ
 */
public class EmpRegServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("hai");
		
		PrintWriter printer=response.getWriter();
		response.setContentType("text/html");
		
		String url="jdbc:mysql://localhost:3306/college";
		String mysqluser="root";
		String mysqlpwd="GANESHgani123#@mysql";
		
		String employeeid=request.getParameter("empid");
		String employeepwd=request.getParameter("emppwd");
		String employeename=request.getParameter("empname");
		String employeedept=request.getParameter("empdept");
		String employeedesig=request.getParameter("empdesig");
		String employeemobile=request.getParameter("empmobile");
		String employeedoj=request.getParameter("empdoj");
		String employeeemail=request.getParameter("empemail");
		String employeeaadhar=request.getParameter("empaadhar");
		String employeedob=request.getParameter("empdob");
		String employeegender=request.getParameter("empgender");
		String employeefather=request.getParameter("empfather");
		String employeetempaddress=request.getParameter("emptempaddress");
		String employeepermaddress=request.getParameter("emppermaddress");
		
		//printer.println("emp id is "+employeeid+" emp pwd is :"+employeepwd);
		System.out.println(employeename);
		System.out.println(employeedept);
		System.out.println(employeedesig);
		System.out.println(employeemobile);
		System.out.println(employeedoj);
		System.out.println(employeeemail);
		System.out.println(employeeaadhar);
		System.out.println(employeedob);
		System.out.println(employeegender);
		System.out.println(employeefather);
		System.out.println(employeetempaddress);
		System.out.println(employeepermaddress);
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
		//printer.println("succesfully connected");
		String empinsquery="INSERT INTO EMPREGISTRATION values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(empinsquery);
		
		pst.setString(1, employeeid);
		pst.setString(2, employeename);
		pst.setString(3, employeedept);
		pst.setString(4, employeedesig);
		pst.setString(5, employeemobile);
		pst.setString(6, employeedoj);
		pst.setString(7, employeeemail);
		pst.setString(8, employeeaadhar);
		pst.setString(9, employeedob);
		pst.setString(10, employeegender);
		pst.setString(11, employeefather);
		pst.setString(12, employeetempaddress);
		pst.setString(13, employeepermaddress);
		
		int rows=pst.executeUpdate();
		
		String emploginquery="INSERT INTO EMPLOGIN values(?,?)";
		PreparedStatement psk=con.prepareStatement(emploginquery);
		
		psk.setString(1, employeeid);
		psk.setString(2, employeepwd);
		
		int ro=psk.executeUpdate();
		
		if(rows>0)
		{
//		printer.println(rows+"rows effected");
		printer.println("<div class='servmsg'>");
		printer.println("<h2>"+"data Registered successfully"+"</h2>");
		printer.println("</div>");
		RequestDispatcher rd=request.getRequestDispatcher("employeeregistration.html");
		rd.include(request, response);
		}
		else
		{
			printer.println("<div class='servmsg'>");
			printer.println("<h2 style='color:red'>"+"Registration failed"+"</h2>");
			printer.println("</div>");
			RequestDispatcher rd=request.getRequestDispatcher("employeeregistration.html");
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
			RequestDispatcher rd=request.getRequestDispatcher("employeeregistration.html");
			rd.include(request, response);
		}
		
	}

}
