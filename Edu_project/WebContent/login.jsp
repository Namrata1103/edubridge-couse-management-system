<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Jsp</title>
</head>
<body bgcolor="#FFFF99">
<center>
<font color="black" size="8">
<div style= padding:50px;>
<%
String userid=request.getParameter("userid");
//session.putValue("userid", userid);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edubridge","root","root");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users where userid='" +userid+ "' and password='"+password+"'");
if(rs.next()){
	if(rs.getString(2).equals(password)){
		out.println("welcome "+userid);
	}else
	{
		out.println("Invalid password try again");
	}
}
else


%><br>
<br>
<br>
<a href="viewuser.jsp">View User</a>

<br>
<br>
<a href="index.html">Logout</a>
<%--- <button href="index.html" >Logout</button>
 <button onclick="index.html">
      Click Here
    </button>
    
     
      <input type="button" onclick="index.html" value="w3docs" />--%>
      </div>
      </font>
</center>      
</body>
</html>