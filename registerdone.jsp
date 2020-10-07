<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>

<%@ page errorPage="error.jsp"%>

<%

Patient patient = null;
		
if(request.getAttribute("patientObj") != null) {
	 
	patient = (Patient) request.getAttribute("patientObj");
	
} else { 
	/*
	* if request does not have the attribute studentObj, 
	* means that user tried to access this page directly (via the url).
	* In that case, redirect back to form.
	*/
	
	response.sendRedirect("patient-register.jsp");
	return;
}

%>

<!DOCTYPE html>
<html lang="en">
	<head>
	
	
    <link rel="stylesheet" href="css/register-done.css">
	
	<title> Registration done</title>
	<meta http-equiv="refresh" content="1;url=<%=request.getContextPath() %>/index.jsp" />

	</head>

	<body>
	
		

		<div class="container">

			<div class="page-header">
				<h1>Registration done</h1>				
				
			</div>

			<div class="row">
				<div class="col-xs-12 col-md-10 col-lg-8">

					<h2>Your registration completed successfully</h2>
					<h3>You can now login!!</h3>
					
				</div>

			</div>
			
			
		</div>
		

	
	</body>
</html>