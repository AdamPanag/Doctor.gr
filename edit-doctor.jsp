<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%
	SpecialtyDAO sDAO = new SpecialtyDAO();
	List<Specialty> s =  sDAO.getAllSpecialties();

	AreaDAO aDAO = new AreaDAO();
	List<Area> a =  aDAO.getAllAreas();

	DoctorDAO doctorDAO = new DoctorDAO();
	Doctor doctor = doctorDAO.getDoctorInfo();
%>

<!DOCTYPE html> 
<html lang="en">
<head>
	
	<title>Doctor.gr | Edit Profile</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/edit-patient.css">
 
</head>

<body>

		<div class="row">
			<div class="col-xs-12 col-md-10 col-lg-8">				

				<form action="/ismgroup96/update-doctor.jsp" method="POST" class="form-horizontal">						

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Name: </label>
						<div class="col-sm-10">
							<input type="text" id="name" name="doctor_name" value="<%= doctor.getName()%>" class="form-control" placeholder="name">
						</div>
					</div>

					<div class="form-group">
						<label for="surname" class="col-sm-2 control-label">Surname: </label>
						<div class="col-sm-10">
							<input type="text" id="surname" name="doctor_surname" value="<%= doctor.getSurname()%>" class="form-control" placeholder="surname">
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">Username: </label>
						<div class="col-sm-10">
							<input type="text" id="username" name="doctor_username" value="<%= doctor.getUsername()%>" class="form-control" placeholder="username">
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Password: </label>
						<div class="col-sm-10">
							<input type="password" id="password" name="doctor_password" value="<%= doctor.getPassword()%>" class="form-control" placeholder="password">
						</div>
					</div>

					<div class="form-group">
						<label for="specialty" class="col-sm-2 control-label">Specialty: </label>
						<div class="col-sm-10">
							<select id="specialty" name="doctor_specialty" class="form-control">
								<option value="">--- Please choose a specialty ---</option>
					<%	for( Specialty s : specialties ) { %>
								<option value="<%=s.getId() %>" <%=(s.getId() == doctor.getSpecialty().getId() ? "selected" : "") %>><%=s.getName() %></option>		
					<% } %>								
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">Phone Number: </label>
						<div class="col-sm-10">
							<input type="text" id="phone" name="doctor_phone" value="<%= doctor.getPhoneNumber()%>" class="form-control" placeholder="phone">
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Email: </label>
						<div class="col-sm-10">
							<input type="email" id="email" name="doctor_email" value="<%= doctor.getEmail()%>" class="form-control" placeholder="email">
						</div>
					</div>

					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">Address: </label>
						<div class="col-sm-10">
							<input type="text" id="address" name="doctor_address" value="<%= doctor.getAddress()%>" class="form-control" placeholder="address">
						</div>
					</div>

					<div class="form-group">
						<label for="area" class="col-sm-2 control-label">Area: </label>
						<div class="col-sm-10">
							<select id="area" name="doctor_area" class="form-control">
								<option value="">--- Please choose an area ---</option>
					<%	for( Area a : areas ) { %>
								<option value="<%=a.getId() %>" <%=(s.getId() == doctor.getArea().getId() ? "selected" : "") %>><%=a.getName() %></option>		
					<% } %>								
							</select>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-2">
							<a href="/ismgroup96/patient-profile.jsp" class="btn btn-default">
								<span class="glyphicon glyphicon-chevron-left"></span> Back
							</a>
							<button type="submit" class="btn btn-success">
								<span class="glyphicon glyphicon-floppy-disk"></span> Save changes
							</button>
							<button type="reset" class="btn btn-default">
								<span class="glyphicon glyphicon-refresh"></span> Undo changes
							</button>

						</div>
					</div>

				</form>				

			</div>
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
</body>  
</html>  