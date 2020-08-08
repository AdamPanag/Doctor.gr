<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
  <link rel="stylesheet" href="css/doctor-client.css">
</head>


 <form class="modal-content" action="/action_page.php">
    

  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <label for="name"><b>Name</b></label>
	<input type="text" placeholder="Enter Name" name="name" required>
	  
	 <label for="surname"><b>Surname</b></label>
     <input type="text" placeholder="Enter Surname" name="surname" required>
	  
	  
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
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</html>