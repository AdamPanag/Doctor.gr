<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

  <title>Doctor.gr</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link rel="stylesheet" type="text/css" href="css/homepage.css">


</head>
<body>

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
	        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          		Login/Register
	        		</a>
	        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			          	<a class="dropdown-item" href="#">Patient</a>
			          	<a class="dropdown-item" href="#">Doctor</a>
	        		</div>
	      		</li>
	    	</ul>
	  	</div>
  	</div>
</nav>

<!-- Page Content -->
<header id="home-header">
	<br><br><br><br><br><br><br><br>
	<h1 id="main-slogan">Find your doctor and book an appointment!</h1>
	<br><br>
	<form action="search-result.jsp" method="POST">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-4">
				<input list="specialties" name="specialty" class="search-input" placeholder="Doctor's specialty">
				<datalist id="specialties">
					<option value="Pathologos">
					<option value="Ginaikologos">
					<option value="Ourologos">
				</datalist>
				
			</div>
			<div class="col-3">
				<input list="locations" name="location" class="search-input" placeholder="Where?">
				<datalist id="locations">
					<option value="Ampelokipoi">
					<option value="Galatsi">
					<option value="Ilion">
					<option value="Gizi">
					<option value="Vrilisia">
				</datalist>
			</div>
			<div class="col-1">
				<input type="submit" class="fsSubmitButton" value="Search">
			</div>
			<div class="col-2"></div>
		</div>
	</form>
	
</header>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>