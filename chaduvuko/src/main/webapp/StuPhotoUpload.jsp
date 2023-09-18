<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="jakarta.servlet.annotation.MultipartConfig"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>STUDENT PHOTO UPLOADING</title>
</head>
<body>

<%

	Part file=request.getPart("image");
	String imagefilename=file.getSubmittedFileName();
	out.println(imagefilename);


%>
</body>
</html>