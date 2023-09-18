package org;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


/**
 * Servlet implementation class DisplayStuPhoto
 */
public class DisplayStuPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayStuPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("serv");
		String imageid=request.getParameter("stuphotoregno");
		
		String imgdbid=null;;
		String imgdbfilename = null;
		//connecting to database
		try {
			String url="jdbc:mysql://localhost:3306/college";
			String mysqlusername="root";
			String mysqlpwd="GANESHgani123#@mysql";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,mysqlusername,mysqlpwd);
			String imgquery="SELECT * FROM STUPROFILEPHOTO";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(imgquery);
			while(rs.next())
			{
				if(rs.getString("StuRegNo").equals(imageid))
				{
					imgdbid=rs.getString("StuRegNo");
					imgdbfilename=rs.getString("photofilename");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd;
		request.setAttribute("id",imgdbid);
		request.setAttribute("img",imgdbfilename);
		rd=request.getRequestDispatcher("StuImageDisplay.jsp");
		rd.forward(request,response);
	}
	

}
