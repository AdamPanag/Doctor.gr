<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>

<%	
	boolean patientLogedIn = false;
	Patient patient = (Patient) session.getAttribute("patient-database-obj");
	Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");

	if( patient != null) {
		patientLogedIn = true;
	}

	SpecialtyDAO specialtyDAO = new SpecialtyDAO();
	AreaDAO areaDAO = new AreaDAO();
	List<Specialty> specialties = specialtyDAO.getAllSpecialties();
	List<Area> areas = areaDAO.getAllAreas();
%>

<!DOCTYPE html>
<html>
<head>

  <title>Doctor.gr | Search</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link rel="stylesheet" type="text/css" href="css/homepage.css">
  <link href="css/footer.css" rel="stylesheet">

</head>
<body>

<!-- Navigation Bar-->
<%
	if(doctor != null) {
%>
		<%@ include file="navbar-doctor-appointments.jsp" %>

<%
	} else {
%>
		<%@ include file="navbar-homepage-default.jsp" %>

<%  } %>

<!-- Page Content -->
<div class="page-content">
	<header class="home-header">
		<div class="main-slogan">
			<h1>Find your doctor and book an appointment!</h1>
		</div>
		<div class="search-form">
			<form action="search-result.jsp" method="POST">
				<div class="form-content">
					<div class="col-lg-2 col-12"></div>
					<div class="col-lg-4">
						<input list="specialties" name="specialty" class="search-input" placeholder="Doctor's specialty">
						<datalist id="specialties">
		<% 	for(Specialty speciaclty: specialties) { %>
							<option value="<%=speciaclty.getName() %>">			
		<% 	} %>
						</datalist>
					</div>
					<div class="col-lg-3 col-12">
						<input list="areas" name="area" class="search-input" placeholder="Where?">
						<datalist id="areas">
		<% 	for(Area area: areas) { %>
							<option value="<%=area.getName() %>">
		<% } %>
						</datalist>
					</div>
					<div class="col-lg-1 col-12">
						<input type="submit" id="submit" class="fsSubmitButton" value="Search">
					</div>
					<div class="col-lg-2"></div>
				</div>
			</form>
		</div>
	</header>
</div>

<%@ include file="footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/search.js"></script>

</body>
</html>