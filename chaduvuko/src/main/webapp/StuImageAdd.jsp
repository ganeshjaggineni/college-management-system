<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>STUDENT PHOTO UPLOADING</title>
</head>
<body>

<h1 style='color:green' align='center'>ADD PHOTO </h1>
<div align='center'>
<form action="StuPhotoUpload.jsp" method="post" enctype='multipart/form-data'>
	Select Student PHOTO :
	<input type="file" name="image">
	<input type="submit" value="upload photo">
</form>
</div>
</body>
</html>