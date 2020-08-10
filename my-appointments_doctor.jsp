<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

	<head>
		<title>My appointments - Doctor.gr</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

		<!-- Custom styles for this template -->
		<link href="css/my-appointments_doctor.css" rel="stylesheet">
	
	</head>

	<body onload="renderDate()">
		<!-- Navigation Bar-->
		<nav class="navbar fixed-top navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand" href="#">Doctor.gr</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active">
							<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">About us</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Contact us</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link" href="#">My profile</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

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