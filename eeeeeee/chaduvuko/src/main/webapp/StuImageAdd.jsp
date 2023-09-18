<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>STUDENT PHOTO UPLOADING</title>
<link rel="stylesheet" href="stuimageaddstyle.css">
</head>
<body>
<div class="imgupload">
<h1 style='color:green' align='center'>ADD PHOTO </h1>
<div class="imguploadbox">
<form action="StuPhotoUploadServ" method="post" enctype="multipart/form-data">
	<div class="box">
        <div class="head">
            <h2>Upload Photo</h2>
        </div>
	<h3>Enter Student Registraion No:</h3>
	<input type="text" name="regno">
	<br>
	<h3 class="phot">Select Student PHOTO :</h3>
	<input type="file" name="image" >
	<input type="submit" value="upload">
	</div>
	
	<div class="suctext" id="su">
	
	
	</div>
</form>
</div>
</div>



<div class='servmsg'>
				<h2 style='color:green' id="prev">PHOTO UPLOAD SUCCESFULLY</h2>
			</div>
			
<script>
document.getElementById("prev").stopPropogation();

</script>
</body>
</html>