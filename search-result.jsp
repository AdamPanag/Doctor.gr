<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>

<%	
	boolean patientLogedIn = false;
	Patient patient = (Patient) session.getAttribute("patient-database-obj");
	Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");

	if(patient != null) {
		patientLogedIn = true;
	}


	String specialtySearched = request.getParameter("specialty");
	String areaSearched = request.getParameter("area");

	DoctorDAO doctorDAO = new DoctorDAO();
	SpecialtyDAO specialtyDAO = new SpecialtyDAO();
	AreaDAO areaDAO = new AreaDAO();

	List<Doctor> doctors = doctorDAO.getAllDoctorsBySpecialtyAndArea(specialtySearched, areaSearched);
	List<Specialty> specialties = specialtyDAO.getAllSpecialties();
	List<Area> areas = areaDAO.getAllAreas();
%>

	

<!DOCTYPE html>
<html>
<head>
	<title>Doctor.gr | Search Results</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- Custom styles for this template -->
    <link href="css/search-result.css" rel="stylesheet">
</head>

<body>
	<!-- Navigation Bar-->	
<%
	if(patient != null) {
%>
		<%@ include file="navbar-default.jsp" %>

<%
	} else if(doctor != null) {
%>
		<%@ include file="navbar-doctor-appointments.jsp" %>

<%  } %>

	<!-- New Search Bar -->
	<div id="new-search-bar">
		<form action="search-result.jsp" method="get">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="specialty"></label>
					<input list="specialties" name="specialty" class="search-input" placeholder="Doctor's specialty">
					<datalist id="specialties">
<% 	for(Specialty speciaclty: specialties) { %>
						<option value="<%=speciaclty.getName() %>">			
<% 	} %>
					</datalist>
					
				</div>
				<div class="col-3">
					<label for="area"></label>
					<input list="areas" name="area" class="search-input" placeholder="Where?">
					<datalist id="areas">
<% 	for(Area area: areas) { %>
						<option value="<%=area.getName() %>">
<% } %>
					</datalist>
				</div>
				<div class="col-1">
					<input type="submit" class="btn btn-danger" value="New Search" id="search-button">
				</div>
				<div class="col-2"></div>
			</div>
		</form>
	</div>


	<!-- Search Results. Dsiplay the doctors that meet the search criteria -->
	<div class="container" id="search-result-area">
		<div class="row doctor">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="container">
<%	
	if(doctors.size() == 0) {
%>
		<h4 id="not-found">There are no <%=specialtySearched%>s in <%=areaSearched%>!</h4>
<%
	} else {
		for(Doctor doctorObj: doctors) {
%>					<!-- Doctor's profile -->
					<div class="row mini-profil">
						<div class="col-3">
							<img src="images/profile-pic.jpg" alt="profile" width="100%" height="150">
						</div>
						<div class="col-5">
							<h5><%=doctorObj.getFullName()%></h5>
							<p><%=doctorObj.getSpecialty()%></p>
							<p class="phone-number"><%=doctorObj.getPhoneNumber()%></p>
						</div>
						<div class="col-4 book-now-button-parent">
							<p class="doctor-address"><%=doctorObj.getAddress()%></p>

						<% if(patientLogedIn == true) { %>

							<a type="submit" class="book-now-button btn btn-primary" href="http://ism.dmst.aueb.gr/ismgroup96/book-now.jsp?doctorId=<%=doctorObj.getId()%>">Book now</a>

						<% } else {%>

							<a type="submit" class="book-now-button btn btn-primary unable-btn" onclick="loginFirstPopUp()">Book now
								<span class="popuptext myPopup">Log in as patient in order to book an appointment</span>
							</a>

						<% } %>

						</div>
					</div> <!-- end of Doctor's profile -->
<%		}
	}
%>
				</div>
			</div>
			<div class="col-2"></div>
		</div>

		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/searchResult.js"></script>
	
</body>
</html>