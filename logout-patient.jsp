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

		<!-- automatically will redirect to index.jsp after 2 seconds -->
		<meta http-equiv="refresh" content="2;url=<%=request.getContextPath() %>/index.jsp" />
		
		<meta name="description" content="Log out page">
		<title>Log out page</title>
	
	</head>
	<body>	

	<div class="container theme-showcase" role="main">

		<div class="alert alert-success text-center" role="alert">Logged Out</div>		

	</div>
	<!-- /container -->
	
</body>
</html>
