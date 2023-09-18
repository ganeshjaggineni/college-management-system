package org;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SampleServlet extends HttpServlet{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response)
	 throws IOException
	 {
	 String username = request.getParameter("name");
	 String password = request.getParameter("pwd");
	 String uname="admin";
	 String pass="admin123";
	 PrintWriter out = response.getWriter();
	 if(username.equals(uname) && password.equals(pass))
	 {
	 out.println("<html>");
	 out.println("<body>");
	 out.println("<h1>welcome to:"+username+"</h1>");
	 out.println("</body>");
	 out.println("</html>");
	 }
	 else
	 {
	 out.println("<h1>Invalid User</h1>");
	 }
	 }

}
