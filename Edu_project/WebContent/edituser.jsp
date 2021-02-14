<%@page import="database.connection.com.DBConnection"%>
<jsp:useBean id="u" class="database.connection.bean.DBbean"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=DBConnection.update(u);
response.sendRedirect("viewuser.jsp");
%>
