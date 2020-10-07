<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>
<%@ page errorPage="error.jsp"%>

<%-- restrict page access --%>
<%@ include file="doctorAuthenticationGuard.jsp"%>

<%
	SpecialtyDAO specialtyDAO = new SpecialtyDAO();
	List<Specialty> specialties =  specialtyDAO.getAllSpecialties();
	
	AreaDAO areaDAO = new AreaDAO();
	List<Area> areas =  areaDAO.getAllAreas();
	
	Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");
	DoctorDAO doctorDAO = new DoctorDAO();
	doctor = doctorDAO.getDoctorInfo(doctor.getId());
%>

<!DOCTYPE html> 
<html lang="en">
<head>
	
	<title>Doctor.gr | Edit Profile</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/edit-profile.css">
 
</head>

<body>

	<% if(request.getAttribute("error-message") != null) { %>
	<div class="alert alert-danger">
		<b>Error:</b> <%=(String)request.getAttribute("error-message") %> 
	</div>
	<% } %>

	<div class="card">
		<div class="card-body">
		<div class="row">
			<div class="col-xs-12 col-md-10 col-lg-8">
				<form action="/ismgroup96/update-doctor.jsp" method="POST" class="form-horizontal">						

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Change Name: </label>
						<div class="col-sm-10">
							<input type="text" id="name" name="doctor_name" value="<%= doctor.getName()%>" class="form-control" placeholder="name">
						</div>
					</div>

					<div class="form-group">
						<label for="surname" class="col-sm-2 control-label">Change Surname: </label>
						<div class="col-sm-10">
							<input type="text" id="surname" name="doctor_surname" value="<%= doctor.getSurname()%>" class="form-control" placeholder="surname">
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">Change Username: </label>
						<div class="col-sm-10">
							<input type="text" id="username" name="doctor_username" value="<%= doctor.getUsername()%>" class="form-control" placeholder="username">
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Change Password: </label>
						<div class="col-sm-10">
							<input type="password" id="password" name="doctor_password" value="<%= doctor.getPassword()%>" class="form-control" placeholder="password">
						</div>
					</div>

					<div class="form-group">
						<label for="psw-confirm" class="col-sm-2 control-label"> Confirm Password: </label>
						<div class="col-sm-10">
							<input type="password" id="psw-confirm" name="psw-confirm" value="<%= doctor.getPassword()%>" class="form-control" placeholder="password">
						</div>
					</div>
					<script src = "js/confirm.js"></script>

					<div class="form-group">
						<label for="doctor_specialty">Change Specialty: </label>
						<div class="col-sm-10">
							<select name="doctor_specialty" id="specialty" placeholder="Specialties">
								<% 	for(Specialty specialty: specialties) { %>
								<option value="<%=specialty.getName() %>"><%=(specialty.getName() == doctor.getSpecialty() ? "selected" : "") %><%=specialty.getName() %></option>			
								<% 	} %>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">Change Phone Number: </label>
						<div class="col-sm-10">
							<input type="text" id="phone" name="doctor_phone" value="<%= doctor.getPhoneNumber()%>" class="form-control" placeholder="phone">
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Change Email Address: </label>
						<div class="col-sm-10">
							<input type="email" id="email" name="doctor_email" value="<%= doctor.getEmail()%>" class="form-control" placeholder="email">
						</div>
					</div>

					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">Change Address: </label>
						<div class="col-sm-10">
							<input type="text" id="address" name="doctor_address" value="<%= doctor.getAddress()%>" class="form-control" placeholder="address">
						</div>
					</div>

					<div class="form-group">
						<label for="doctor_area">Change Area: </label>
						<div class="col-sm-10">
							<select name="doctor_area" id="area" placeholder="Area">
								<% 	for(Area area: areas) { %>
								<option value="<%=area.getName() %>"><%=(area.getName() == doctor.getArea() ? "selected" : "") %><%=area.getName() %></option>			
								<% 	} %>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-2">
							<a href="/ismgroup96/patient-profile.jsp" class="btn btn-default" style="border: 1px solid #e3f2fd;">Back</a>
							<button type="submit" class="btn btn-success" style="background-color: #e3f2fd; border: none; color: black;">Save changes</button>
							<button type="reset" class="btn btn-default" style="border: 1px solid #e3f2fd;">Undo changes</button>
						</div>
					</div>

				</form>				

			</div>
		</div>
	</div>
	</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
</body>  
</html>  