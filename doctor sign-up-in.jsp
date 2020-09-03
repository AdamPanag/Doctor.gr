<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="css/sign in-up.css">


  <title>Doctor.gr | Login - Register</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


</head>
<body>

<!-- Navigation Bar-->
<%@ include file="navbar-login.jsp" %>

<div class="split left">
  <div class="centered">
    <div class="form sign-in">
	  <h2>Sign In</h2>
	  
	  <label>
	    <span>Email Address</span>
		<input type="email" name="email">
	   </label>
	   <label>
	     <span>Password</span>
		 <input type="password" name="password"> 
	   </label>
	   <button class="submit" type="button">Sign In</button>
	   <p class="forgot-pass">Forgot Password ?</p>
	</div>
   </div>
   
</div>
    
    
   
<div class="split right">
  <div class="centered">
	<h2>New here?</h2>
    <p>Sign up now!!</p>
	<a href="doctor.jsp"><button>Sign up</button></a>
    
  </div>
</div>
  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	   
</body>


</html>