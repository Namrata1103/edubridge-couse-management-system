<%@page import="database.connection.com.DBConnection,database.connection.bean.DBbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="FFCCCC">
<center>
<%
String userid=request.getParameter("userid");
DBbean u=DBConnection.getRecordById(userid);
%>

<h1>Edit Form</h1>
<form action="edituser.jsp" method="post">
<table>
User Id &nbsp&nbsp&nbsp&nbsp
<input type="text" name="userid" value="<%=u.getuserid() %>"/>

<tr><td>Password:</td><td><input type="password" name="password" value="<%= u.getpassword()%>"/></td></tr>
<tr><td>fname:</td><td><input type="text" name="fname" value="<%= u.getfname()%>"/></td></tr>
<tr><td>lname:</td><td><input type="text" name="lname" value="<%= u.getlname()%>"/></td></tr>
<tr><td>email:</td><td><input type="text" name="email" value="<%= u.getemail()%>"/></td></tr>

<tr><td colspan="2"><button type="Submit">SUBMIT</button></td></tr>
</table>
</form>
</center>
</body>
</html>