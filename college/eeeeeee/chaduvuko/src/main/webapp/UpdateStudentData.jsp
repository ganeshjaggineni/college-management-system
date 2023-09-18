<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%!
		String url="jdbc:mysql://localhost:3306/college";
		String mysqluser="root";
		String mysqlpwd="GANESHgani123#@mysql";
		
	%>
<!DOCTYPE html>
<html>
<head>
<title>Studenet Data Updation</title>
<link rel="stylesheet" href="updatestudatastyle.css">
<link rel="stylesheet" href="updatestudbstyle.css">

</head>
<body>
	<div class="updatecontainer">
		<div class="updatebox">
			<div class="updatehead">
				<h2>Update Student Data</h2>
			</div>
			<div class="box">
			<form method="get" action="UpdateStudentData.jsp">
                <label>Enter Student Registration No:</label>
                <input type="text" name="uid" value="21761A0590" placeholder="Student Registration No :">
                <div class="butt">
                <input type="submit" value="Get Data" onclick="update()">
            </div>
            </form>
			</div>
		</div>
	</div>
	
	<%String use=request.getParameter("uid"); %>
	
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,mysqluser,mysqlpwd);
	String query="SELECT * FROM STUREGISTRATION WHERE StuRegNo=?";
	PreparedStatement pst=con.prepareStatement(query);
	
	pst.setString(1,use);
	ResultSet resultset =pst.executeQuery();
	
	if(resultset.next())
	{%>
		 <div class="updatedbbox">
		 <div class="regiscontainer">
            <div class="regisheader">
                <h2>Student Details Update</h2>
            </div>
		 <div class="details">
                <h2>Academic Details</h2>
            </div>
            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuid.gif" width="50px" height="50px"/>
                </div>
                <label>Registration No.</label>
            <input  type="text" size="10" name="sturegno"  id="sname" value='<%=resultset.getString(1)%>' required autofocus placeholder="Enter Student Registration No.">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stupwd.gif" width="50px" height="50px"/>
                </div>
                <label>Password</label>
            <input type="password" size="15" name="stupwd" id="spwd" value="passw" required placeholder="Enter Student Password">
            </div>
            <!-- <input type="file"/> -->
            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stujoindate.gif" width="50px" height="50px"/>
                </div>
                <label>Joining Date</label>
            <input type="date"  name="stujoindate"  value='<%=resultset.getString(15)%>'required>
            </div>
            
            
             <div class="field">
                <div class="regicons">
                    <img src="codeimages/stubranch.gif" width="50px" height="50px"/>
                </div>
                <label>Branch</label>
            <select name="branch" required>
                <option>CSE</option>
                <option >CSM</option>
                <option >ECE</option>
                <option >CSE</option>
                <option >MECH</option>
                <option >CYBER SECURITY</option>
            </select>
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stujoinyear.gif" width="50px" height="50px"/>
                </div>
                <label>Joining Year</label>
            <select name="stuyear">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuexam.gif" width="50px" height="60px"/>
                </div>
                <label>Joining Sem</label>
            <select name="stusem">
                <option value="1">1</option>
                <option value="2">2</option>
            </select>
            </div>

            <!-- <input type="date" size="50" name="acadyear" placeholder="Enter Student Academic Year"> -->
            <!-- <h3>Personal Details</h3> -->
            <div class="details">
                <h2>Student Details</h2>
            </div>
            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuname.gif" width="50px" height="50px"/>
                </div>
                <label>Student Name</label>
            <input type="text" size="15" name="stuname"  value='<%=resultset.getString(2)%>' required  placeholder="Enter Student Name">
            </div>

            <div class="fie">
                <div class="regicons">
                    <img src="codeimages/stugender.gif" width="50px" height="50px"/>
                </div>
                <label>Student Gender</label>
                <div class="radi">
            <input type="radio" name="stugender" value="male"/>Male
            <input type="radio" name="stugender" value="female" />Female
        </div>
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/studob.gif" width="50px" height="50px"/>
                </div>
                <label>Student DOB</label>
            <input type="date"  name="studob" required value='<%=resultset.getString(4)%>' placeholder="Enter Student Dob">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stumother.gif" width="50px" height="50px"/>
                </div>
                <label>Student Mother name</label>
            <input type="text" size="15" name="stumothername" value='<%=resultset.getString(8)%>' required placeholder="Enter Student Mother Name">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stufather.gif" width="50px" height="50px"/>
                </div>
                <label>Student Father Name</label>
            <input type="text" size="15" name="stufathername"  value='<%=resultset.getString(9)%>' required placeholder="Enter Student Father Name">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuaddress.gif" width="50px" height="50px"/>
                </div>
                <label>Student Address</label>
            <input type="text" size="25" name="stuaddress" value='<%=resultset.getString(14)%>' required placeholder="Enter Student Address">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stumob.gif" width="50px" height="50px"/>
                </div>
                <label>Student Mobile No.</label>
            <input type="tel" size="10" name="stumobile" value='<%=resultset.getString(10)%>' required placeholder="Enter Student Mobile">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/partel.gif" width="50px" height="50px"/>
                </div>
                <label>Parent Mobile No.</label>
            <input type="tel" size="10" name="stuparmobile" value='<%=resultset.getString(11)%>' required placeholder="Enter Parent Mobile">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/Aadhaar.gif" width="50px" height="50px"/>
                </div>
                <label>Studet Aadhar</label>
            <input type="text" size="11" name="stuaadhar" value='<%=resultset.getString(12)%>' required placeholder="Enter Student Aadhar">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuemail.gif" width="50px" height="50px"/>
                </div>
                <label>Student Email</label>
            <input type="email" size="25" name="stuemail" value='<%=resultset.getString(13)%>' required placeholder="Enter Student Email">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stueamcetres.gif" width="50px" height="50px"/>
                </div>
                <label>Eamcet Hallticket</label>
            <input type="text" size="15" name="stueamcetht"  required value='<%=resultset.getString(16)%>' placeholder="Enter Student Eamcet Hallticket No.">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stueamcet.gif" width="50px" height="50px"/>
                </div>
                <label>Eamcet Rank</label>
            <input type="text" size="15" name="stueamcetrank" required value='<%=resultset.getString(17)%>' placeholder="Enter Student Eamcet Rank">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuinterclg.gif" width="50px" height="50px"/>
                </div>
                <label>Student Inter Clg Name</label>
            <input type="text" size="15" name="stuinterclg"  required value='<%=resultset.getString(18)%>' placeholder="Enter Student Inter Clg Name">
            </div>
            
                </div>
                </div>
	<%} %>

</body>
<script>
function update()
{
	window.location.href="UpdateStudentData.jsp";
	}
</script>

</html>