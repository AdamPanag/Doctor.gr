<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>

<%-- restrict page access --%>
<%@ include file="patientAuthenticationGuard.jsp"%>

<%
	String doctorFullName = request.getParameter("doctor_full_name");
	String date = request.getParameter("date");
	String hour = request.getParameter("hour");

	Patient patient = null;
	patient = (Patient) session.getAttribute("patient-database-obj");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Doctor.gr | Booking Done</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- Custom styles for this template -->
    <link href="css/booking-done.css" rel="stylesheet">	
</head>
<body>

    <!-- Navigation Bar-->
	<%@ include file="navbar-default-patient.jsp" %>

	<div id="content">
		<div class="container">
			<h4 id="message">You have booked an appointment with <%=doctorFullName%> at <%=hour%> on the <%=date%></h4>
			<a id="go-to-homepage" href="http://ism.dmst.aueb.gr/ismgroup96/index.jsp?">Go to Homepage</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
</body>
</html>