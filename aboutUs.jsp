<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	Patient patient = (Patient) session.getAttribute("patient-database-obj");
	Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");
%>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>About Us</title>
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
    <!-- Custom styles for this template -->
	<link rel="stylesheet" type="text/css" href="css/contactUs.css">
</head>

<body>

	<!-- Navigation Bar-->
	<%	if(doctor != null) {	%>
		<%@ include file="navbar-aboutUs-doctor.jsp" %>
	<%	} else if (patient != null){	%>
		<%@ include file="navbar-aboutUs-patient.jsp" %>
	<%  } else {	%>
		<%@ include file="navbar-aboutUs-default.jsp" %>
	<%	}	%>
	
	<div class="page-content">
		<div class="bg-contact2" style="background-image: url('images/homepage_image.jpg');">
			<div class="container-contact2">
				<div class="wrap-contact2">
					<h4>About Us</h4>
					<p class="about-text">
						We are four students at the Department of Management Science and Technology
						of the Athens University of Economics & Business. This web application was created
						for the needs of the course "Information Systems Development and Architecture".
					</p>
					<br>
					<p class="about-text">
						Doctor.gr is an online platform which aims to connect patients with doctors and make
						the appointment booking experience easy and effordless. 
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>