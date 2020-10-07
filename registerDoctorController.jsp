<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%@ page errorPage="error.jsp"%>

<%


//read parameters from request
String name = request.getParameter("name");
String surname = request.getParameter("surname");
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");
String specialty = request.getParameter("specialty");
String area = request.getParameter("area");
String address = request.getParameter("address");
String phoneNumber = request.getParameter("telephone-number");

SpecialtyDAO speDAO = new SpecialtyDAO();
AreaDAO areDAo = new AreaDAO();
DoctorRegisterService doctorRegisterService = new DoctorRegisterService(); 


DoctorDataValidator dovalidator = new DoctorDataValidator();
DoctorDAO doctorDAO= new DoctorDAO();

int countErrorss = 0;
String errorMessagee = "";


try {
	
	
	if(name != null) {
		//For the Greek characters.
		name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
	}
	
	//validate name
	if( !dovalidator.isNameeValid( name ) ) {
		errorMessagee += "<li>Name should have from 3 (min) to 45 (max) characters</li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Name is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
	
	if(surname != null) {
		//For the Greek characters.
		surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
	}	
	
	//validate surname
	if( !dovalidator.isSurnameeValid( surname ) ) {
		errorMessagee += "<li>Surname should have from 3 (min) to 45 (max) characters</li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Surname is not valid" );
		//errorPage.forward(request, response);
		//return;
	}	

	//validate email
	if( !dovalidator.isValidEmail( email ) ) {
		errorMessagee += "<li>Email is not valid</li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Email is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
	
	//get all doctor emails from database
	ArrayList<String> emails = doctorDAO.getAllDoctorEmails(email); 
	
	//check if emails exists
	if(dovalidator.emailExists(email, emails)) {
		errorMessagee += "<li>Email exists</li>";
		countErrorss++;
	}

	//validate address
	if( !dovalidator.isValidAddress( address ) ) {
		errorMessagee += "<li> Address is not valid </li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Address is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
		
	
	if(username != null) {
		//For the Greek characters.
		username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
	}	
	
	//validate username
	if( !dovalidator.isUsernameeValid( username ) ) {
		errorMessagee += "<li>Username should have from 3 (min) to 45 (max) characters</li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Username is not valid" );
		//errorPage.forward(request, response);
		//return;
	}
	
	//get all doctor usernames from database
	ArrayList<String> usernames = doctorDAO.getAllDoctorUsernames(username); 
	
	//check if usernames exist
	if(dovalidator.usernameExists(username, usernames)) {
		errorMessagee += "<li>Username exists</li>";
		countErrorss++;
	}

	
	
	//validate password
	if( !dovalidator.isPassworddValid( password ) ) {
		errorMessagee += "<li>Password should have at least 8 characters including a lowercase letter, an uppercase letter and a number</li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Password is not valid" );
		//errorPage.forward(request, response);
		//return;	
	}
		
	//validate phone
	if( !dovalidator.isValidPhoneNumber( phoneNumber ) ) {
		errorMessagee += "<li>Phone Number is not valid (should starts with 21 or 22 or 69 and has 10 total digits)</li>";
		countErrorss++;
		//request.setAttribute( "error-message", "Phone Number is not valid" );
		//errorPage.forward(request, response);
		//return;
	}

	if (countErrorss > 0) {
		
		errorMessagee = "<ol>" + errorMessagee + "</ol>";
		request.setAttribute( "error-message", errorMessagee);
%>
		<jsp:forward page="doctor.jsp"/>	
<%		
	}	
	
	
	Doctor doctor = new Doctor('1', name, surname, username, password, specialty, phoneNumber, email, address, area);
 			
 
	doctorRegisterService.register(doctor);	

	
	request.setAttribute("doctorObj", doctor);
	
%>
	<jsp:forward page="dregisterdone.jsp"></jsp:forward>

<%
	//example usage of custom exceptions
}  catch(ApplicationCustomExceptionDatabase e) { 
	
	
request.setAttribute( "error-message", e.getMessage());
%>
	<jsp:forward page="doctor.jsp"/>	
<%
	
}  catch(Exception e) { 
	
	throw new Exception( "" +e ); 
	
} 
%>
