<%@page import="database.connection.com.DBConnection,database.connection.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#CCFFCC">
<h1>Users List</h1>

<%
List<DBbean> list=DBConnection.getAllRecords();
request.setAttribute("list",list);
%>
<table border="1" width="90%">
<tr><th>UserId</th><th>Password</th><th>First name</th><th>Last Name</th>
<th>Email</th><th>Edit</th><th>Delete</th></tr>

<c:forEach items="${list}" var="u">
	<tr><td>${u.getuserid()}</td>
	<td>${u.getpassword()}</td>
	<td>${u.getfname()}</td>
	<td>${u.getlname()}</td>
	<td>${u.getemail()}</td><td>
	<a href="editform.jsp?userid=${u.getuserid()}">Edit</a></td>
	<td><a href="deleteform.jsp?userid=${u.getuserid()}">Delete</a></td></tr>
</c:forEach>
</table>
<br/><a href="Reg.html">Add New User</a>


</body>
</html>
