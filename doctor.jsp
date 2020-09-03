<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="database.*, model.*, java.util.List" %>

<%
	SpecialtyDAO specialtyDAO = new SpecialtyDAO();
	AreaDAO areaDAO = new AreaDAO();
	List<Specialty> specialties = specialtyDAO.getAllSpecialties();
	List<Area> areas = areaDAO.getAllAreas();
%>






<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="css/doctor-client.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>

<body>

  <form class="modal-content" action="/action_page.php">
    <div class="container">
      <h1>Sign Up</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>
	  <label for="name"><b>Name</b></label>
	  <input type="text" placeholder="Enter Name" name="name" required>
	  
	  <label for="surname"><b>Surname</b></label>
      <input type="text" placeholder="Enter Surname" name="surname" required>
	  
	  <label for="specialties"><b>Specialties</b></label>
	  <input list="specialties" name="specialty" class="search-input" placeholder="Doctor's specialty">

	  <datalist id="specialties">
	  
	  <% 	for(Specialty speciaclty: specialties) { %>
					<option value="<%=speciaclty.getName() %>">			
<% 	} %>
				</datalist>
				
		<br><br>
	   <label for="areas"><b>Area</b></label>
	   	<input list="areas" name="area" class="search-input" placeholder="Where?">

	   

	   <datalist id="areas">
      <% 	for(Area area: areas) { %>
					<option value="<%=area.getName() %>">
<% } %>
      
	   				</datalist>

	   <br><br>
	  <label for="telephone-number"><b>Telephone Number</b></label>
      <input type="text" placeholder="Enter Telephone Number" name="telephone-number" required>

	  
      
	 
	  
	  <label for="address"><b>Address</b></label>
      <input type="text" placeholder="Enter Address "="address" required>
	  
	  <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>
      
	  
	  <label for="username"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="username" required>
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>

      <label for="psw-confirm"><b>Confirm Password</b></label>
      <input type="password" placeholder="Confirm Password" name="psw-confirm" required>

      <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
      </label>

      

      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="submit" class="signup">Sign Up</button>
      </div>
    </div>
  </form>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/search.js"></script>

</body>
</html>