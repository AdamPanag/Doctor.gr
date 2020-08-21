<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>

<%
	String doctorFullName = request.getParameter("doctor_full_name");
	String date = request.getParameter("date");
	String hour = request.getParameter("hour");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Doctor.gr | Booking Done</title>
</head>
<body>

	<h3>You have booked an appointment with <%=doctorFullName%> at <%=hour%> on the <%=date%></h3>

	<a href="http://ism.dmst.aueb.gr/ismgroup96/index.jsp?">Go to Homepage</a>

</body>
</html>