<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%
	PatientDAO patientDAO = new PatientDAO();
	Patient patient = patientDAO.getPatientInfo();
%>

<!doctype html>
<html lang="en">
<head>
	
	<title>Doctor.gr | My Profile</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/patient-profile.css">

</head>

<body onload="renderDate()">

	<!-- Navigation Bar-->
	<%@ include file="navbar-patient.jsp" %>

	<!-- Page Content -->
	<div class="col-md-8 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<p class="card-title font-weight-bold">Settings</p>
				<hr>
				<p class="card-description">Personal Information</p>
				<ul class="about">
					<li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Name:</span><span class="about-item-detail"><%=patient.getName()%></span></li>
					<li class="about-items"><i class="mdi mdi-mail-ru icon-sm "></i><span class="about-item-name">Surname:</span><span class="about-item-detail"><%=patient.getSurname()%></span></li>
					<li class="about-items"><i class="mdi mdi-mail-ru icon-sm "></i><span class="about-item-name">Username:</span><span class="about-item-detail"><%=patient.getUsername()%></span></li>
					<li class="about-items"><i class="mdi mdi-lock-outline icon-sm "></i><span class="about-item-name">Password:</span><span class="about-item-detail"><%=patient.getPassword()%></span></li>
					<li class="about-items"><i class="mdi mdi-lock-outline icon-sm "></i><span class="about-item-name">SSN:</span><span class="about-item-detail"><%=patient.getSsn()%></span></li>
				</ul>
				<p class="card-description">Contact Information</p>
				<ul class="about">
					<li class="about-items"><i class="mdi mdi-phone icon-sm "></i><span class="about-item-name">Phone Number:</span><span class="about-item-detail"><%=patient.getPhoneNumber()%></span></li>
					<li class="about-items"><i class="mdi mdi-map-marker icon-sm "></i><span class="about-item-name">Email:</span><span class="about-item-detail"><%=patient.getEmail()%></span></li>
				</ul>
				<a href="/ismgroup96/edit-patient.jsp?patientId='1'" 
							class="btn btn-xs btn-default btn-block"
							title="Edit">
							<span class="glyphicon glyphicon-edit"></span> Edit
						</a>
						<button type="button" class="btn btn-xs btn-danger btn-block"
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<p class="card-tittle font-weight-bold">My Appointments</p>
				<hr>
				<div class="wrapper">
					<div class="calendar">
						<div class="month">
							<div class="prev" onclick="moveDate('prev')">
								<span>&#10094;</span>
							</div>
							<div>
								<h2 id="month"></h2>
								<p id="date_str"></p>
							</div>
							<div class="next" onclick="moveDate('next')">
								<span>&#10095;</span>
							</div>
						</div>
						<div class="weekdays">
							<div>Sun</div>
							<div>Mon</div>
							<div>Tue</div>
							<div>Wed</div>
							<div>Thu</div>
							<div>Fri</div>
							<div>Sat</div>
						</div>
						<div class="days"></div>
					</div>
				</div>
				<script src="js/calendar.js"></script>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>