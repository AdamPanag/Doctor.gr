<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>
<%@ page errorPage="error.jsp"%>




<!DOCTYPE html>


<html>
<head>
  <link rel="stylesheet" href="css/doctor-patient.css">
</head>



 <body>   

  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
	<% if(request.getAttribute("error-message") != null) { %>
		
			<div class="alert alert-danger">
				<b>Error:</b> <%=(String)request.getAttribute("error-message") %> 
			</div>
	
<% } %>

	<div class="row">
		
	    <div class="col-xs-12">
			
				<form class="form-horizontal" method="POST" action="registerController.jsp">
				  
				  <div class="form-group">
						<label for="name" class="col-sm-2 control-label">Name</label>
						<div class="col-sm-6">
						  <input type="text" class="form-control" name="name" id="name" placeholder="Enter Name" required>
						</div>
					  </div>
				  
				  <div class="form-group">
						<label for="surname" class="col-sm-2 control-label">Surname</label>
						<div class="col-sm-6">
						  <input type="text" class="form-control" name="surname" id="surname" placeholder="Enter Surname" required>
						</div>
					  </div>
				  <div class="form-group">
						<label for="ssn" class="col-sm-2 control-label">SSN</label>
						<div class="col-sm-6">
						  <input type="text" class="form-control" name="ssn" id="ssn" placeholder="Enter SSN" required>
						</div>
					  </div>
				  
				  <div class="form-group">
						<label for="email" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
						  <input type="text" class="form-control" name="email" id="email" placeholder="Enter Email" required>
						</div>
					  </div>
				   
				  <div class="form-group">
						<label for="username" class="col-sm-2 control-label">Username</label>
						<div class="col-sm-6">
						  <input type="text" class="form-control" name="username" id="username" placeholder="Enter Username" required>
						</div>
					  </div>
					  
				  <div class="form-group">
						<label for="psw" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-6">
						  <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
						</div>
					  </div>
				   
				  <div class="form-group">
						<label for="psw-confirm" class="col-sm-2 control-label">Confirm Password</label>
						<div class="col-sm-6">
						  <input type="password" class="form-control" name="psw-confirm" id="psw-confirm" placeholder="Confirm Password" required>
						</div>
					  </div>

                   <div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
						  <button type="submit" class="btn btn-lg btn-success"><span class="glyphicon glyphicon-ok"></span> Submit</button> 
						  <button type="reset" style="background-color:red;" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
						</div>
					  </div>
				</form>
			
			
				
		</div>
    
	</div>
	
 </div>

<script src = "js/confirm.js"></script>

</body>
</html>