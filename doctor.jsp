<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	  
	  <label for="specialty"><b>Specialty</b></label>
      <li class="item dropdown">
	        		<a class="link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          		Choose your speciality
	        		</a>
	        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			          	<a class="dropdown-item" href="#">General Doctor</a>
			          	<a class="dropdown-item" href="#">Pediatrician</a>
					    <a class="dropdown-item" href="#">Pathologist</a>
                    </div>
	   </li>
	   
	   <br><br>
	  <label for="telephone-number"><b>Telephone Number</b></label>
      
	  <form action="/action_page.php">
        <br><br>
        <input type="tel" id="phone" name="phone" placeholder="123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required><br><br>
        <small>Format: 123-45-678</small><br><br>
	  </form>
      
	  <label for="address"><b>Address</b></label>
      <input type="text" placeholder="Enter Address "="address" required>
	  
	  <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>

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

</body>
</html>