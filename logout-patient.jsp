<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="database.*, model.*"%>

<%
if(session.getAttribute("patient-database-obj") == null) {
	request.setAttribute("message", "You are not connected. Please login.");
%>
	<jsp:forward page="client sign-up-in.jsp" />	
<%
}

Patient patient = (Patient)session.getAttribute("patient-database-obj");

session.invalidate();


%>

<!DOCTYPE html>
<html lang="en">

<head>

		<!-- automatically will redirect to index.jsp -->
		<meta http-equiv="refresh" content="0;url=<%=request.getContextPath() %>/index.jsp" />
		
		<meta name="description" content="Log out page">
		<title>Log out page</title>
	
</head>
<body>	

</body>
</html>
