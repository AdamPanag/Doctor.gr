<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>

<%@ page errorPage="error.jsp"%>

<%

//read parameters from request


String name = request.getParameter("name");
String surname = request.getParameter("surname");
String ssn = request.getParameter("ssn");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");



PatientRegisterService patientRegisterService = new PatientRegisterService(); 


PatientDataValidator pavalidator = new PatientDataValidator();

int countErrors = 0;
String errorMessage = "";

//Validate data using PatientDataValidator
try {
	
	
	
	if(name != null) {
		//For the Greek characters.
		name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
	}
	
	//validate name
	if( !pavalidator.isNameValid( name ) ) {
		errorMessage += "<li>Name should have from 3 (min) to 45 (max) characters</li>";
		countErrors++;
		//request.setAttribute( "error-message", "Name is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
	
	if(surname != null) {
		//For the Greek characters.
		surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
	}	
	
	//validate surname
	if( !pavalidator.isSurnameValid( surname ) ) {
		errorMessage += "<li>Surname should have from 3 (min) to 45 (max) characters</li>";
		countErrors++;
		//request.setAttribute( "error-message", "Surname is not valid" );
		//errorPage.forward(request, response);
		//return;
	}	
     
	//validate ssn
	if( !pavalidator.isSsnValid( ssn ) ) {
		errorMessage += "<li>SSN should have 9 digits</li>";
		countErrors++;
		//request.setAttribute( "error-message", "SSN is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
	 
	//validate email
	if( !pavalidator.isValidEmailAddress( email ) ) {
		errorMessage += "<li>Email is not valid</li>";
		countErrors++;
		//request.setAttribute( "error-message", "Email is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
	if(username != null) {
		//For the Greek characters.
		username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
	}	
	
	//validate username
	if( !pavalidator.isUsernameValid( username ) ) {
		errorMessage += "<li>Username should have from 3 (min) to 45 (max) characters</li>";
		countErrors++;
		//request.setAttribute( "error-message", "Username is not valid" );
		//errorPage.forward(request, response);
		//return;
	}	
		
	//validate password
	if( !pavalidator.isPasswordValid( password ) ) {
		errorMessage += "<li>Password should have at least 8 characters including a lowercase letter, an uppercase letter and a number</li>";
		countErrors++;
		//request.setAttribute( "error-message", "Password is not valid" );
		//errorPage.forward(request, response);
		//return;	
	}
	if (countErrors > 0) {
		
		errorMessage = "<ol>" + errorMessage + "</ol>";
		request.setAttribute( "error-message", errorMessage);
%>
		<jsp:forward page="client.jsp"/>	
<%		
	}	
	
	
	Patient patient = new Patient('1', name, surname, username, password, ssn,  email);
 		 
	
		
	// save patient to the database;
	patientRegisterService.register(patient);	

	//add student object to request via an attribute
	request.setAttribute("patientObj", patient);
	
%>
	<jsp:forward page="registerdone.jsp"></jsp:forward>

<%
	//example usage of custom exceptions
}  catch(ApplicationCustomExceptionDatabase e) { 
	
		
request.setAttribute( "error-message", e.getMessage());
%>
	<jsp:forward page="client.jsp"/>	
<%
	
}  catch(Exception e) { 
	
	throw new Exception( e.getMessage() ); 

} 
%>