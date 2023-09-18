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
<script>
function updatestuval()
{	 
	
document.getElementById("dd").innerHTML = "success";
</script>
</head>
<body>
	<div class="updatecontainer">
		<div class="updatebox">
			<div class="updatehead">
				<h2>Update Student Data</h2>
			</div>
			<div class="box">
			<form method="get" >
                <label>Enter Student Registration No:</label>
                <input type="text" name="uid"  placeholder="Student Registration No :">
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
	{ 
	try{
	%>
		 <div class="updatedbbox">
		 <div class="regiscontainer">
            <div class="regisheader">
                <h2>Student Details Update</h2>
            </div>
		 <div class="details">
                <h2>Academic Details</h2>
            </div>
           <form action="studataupdatestatus.jsp" method="get">
            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuid.gif" width="50px" height="50px"/>
                </div>
                <label>Registration No.</label>
            <input  type="text" size="10" name="sturegno" disabled id="sname" value='<%=resultset.getString(1)%>' required autofocus placeholder="Enter Student Registration No.">
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
                <option <%if(resultset.getString(7).equalsIgnoreCase("CSE")){ %>selected<%} %>>CSE</option>
                <option <%if(resultset.getString(7).equalsIgnoreCase("CSM")){ %>selected<%} %>>CSM</option>
                <option <%if(resultset.getString(7).equalsIgnoreCase("ECE")){ %>selected<%} %>>ECE</option>
                <option <%if(resultset.getString(7).equalsIgnoreCase("EEE")){ %>selected<%} %>>EEE</option>
                <option <%if(resultset.getString(7).equalsIgnoreCase("MECH")){ %>selected<%} %>>MECH</option>
                <option <%if(resultset.getString(7).equalsIgnoreCase("CYBER SECURITY")){ %>selected<%} %>>CYBER SECURITY</option>
            </select>
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stujoinyear.gif" width="50px" height="50px"/>
                </div>
                <label>Joining Year</label>
            <select name="stuyear">
                <option value="1" <%if(resultset.getInt(5)==1){ %>
                selected<%} %>
                >1</option>
                <option value="2" <%if(resultset.getInt(5)==2){ %>
                selected<%} %>>2</option>
                <option value="3" <%if(resultset.getInt(5)==3){ %>
                selected<%} %>>3</option>
                <option value="4" <%if(resultset.getInt(5)==4){ %>
                selected<%} %>>4</option>
            </select>
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuexam.gif" width="50px" height="60px"/>
                </div>
                <label>Joining Sem</label>
            <select name="stusem">
                <option value="1" <%if(resultset.getInt(6)==1){ %>selected<%} %>>1</option>
                <option value="2" <%if(resultset.getInt(6)==2){ %>selected<%} %>>2</option>
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
            <input type="radio" name="stugender"  required value="male" <%if(resultset.getString(3).equals("male")){%>checked<%} %> />Male
            <input type="radio" name="stugender" value="female" <%if(resultset.getString(3).equals("female")){%>checked <%} %>>Female
            
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
            <input type="text" size="15" name="stueamcetrank" id="em" required value='<%=resultset.getString(17)%>' placeholder="Enter Student Eamcet Rank">
            </div>

            <div class="field">
                <div class="regicons">
                    <img src="codeimages/stuinterclg.gif" width="50px" height="50px"/>
                </div>
                <label>Student Inter Clg Name</label>
            <input type="text" size="15" name="stuinterclg"  required value='<%=resultset.getString(18)%>' placeholder="Enter Student Inter Clg Name">
            </div>
                            <input type="submit" class="button1" value="Update Student Data" onclick="updatestuval()">
                            <%
                            session.setAttribute("userId", use);
                            %>
    	</form>
            
                </div>
                </div>
                <%}catch(Exception e){ %>
                <div class="servmsg">
<h2 style='color:red'><%out.println(e); %></h2>"
</div>
<%} %>
                
	 <% }else{ %>

<div class="servmsg">
<h2 style='color:red' id="dd">NO Student Found</h2>"
</div>
<%} %>


</body>


</html>