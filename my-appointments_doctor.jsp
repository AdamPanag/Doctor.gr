<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

	<head>
		<title>Doctor.gr | My Appointments</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

		<!-- Custom styles for this template -->
		<link href="css/my-appointments_doctor.css" rel="stylesheet">
	
	</head>

	<body onload="renderDate()">
		<!-- Navigation Bar-->
		<%@ include file="navbar-doctor.jsp" %>


		<!-- Page Content -->
		<header id="main-header">
			<br><br><br><br>
			<h1 id="main-slogan">Your Appointments!</h1>
		</header>
		
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
		
		<script src="js/calendar.js" type="text/javascript"></script>		
		
	</body>

</html>