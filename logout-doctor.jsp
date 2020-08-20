<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="database.*, model.*"%>

<%
if(session.getAttribute("doctor-database-obj") == null) {
	request.setAttribute("message", "You are not connected. Please login.");
%>
	<jsp:forward page="doctor sign-up-in.jsp" />	
<%
}

Doctor doctor = (Doctor)session.getAttribute("doctor-database-obj");

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
</html>