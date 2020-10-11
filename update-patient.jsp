<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>
<%@ page errorPage="error.jsp"%>

<%-- restrict page access --%>
<%@ include file="patientAuthenticationGuard.jsp"%>


<%
	Patient patient = (Patient) session.getAttribute("patient-database-obj");
	int id = patient.getId();

	String name = request.getParameter("patient_name");
	String surname = request.getParameter("patient_surname");
	String username = request.getParameter("patient_username");
	String password = request.getParameter("patient_password");
	String ssn = request.getParameter("patient_ssn");
	String email = request.getParameter("patient_email");

	PatientDataValidator pavalidator = new PatientDataValidator();

	int countErrors = 0;
	String errorMessage = "";

	PatientDAO patientDAO = new PatientDAO();

	//Validate data using PatientDataValidator
	try {

		if(name != null) {
			name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
		}
	
		//validate name
		if( !pavalidator.isNameValid( name ) ) {
			errorMessage += "<li>Name should have from 3 (min) to 45 (max) characters</li>";
			countErrors++;
		}
			
		if(surname != null) {
			surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
		}	
	
		//validate surname
		if( !pavalidator.isSurnameValid( surname ) ) {
			errorMessage += "<li>Surname should have from 3 (min) to 45 (max) characters</li>";
			countErrors++;
		}

		if(username != null) {
			username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
		}	
	
		//validate username
		if( !pavalidator.isUsernameValid( username ) ) {
			errorMessage += "<li>Username should have from 3 (min) to 45 (max) characters</li>";
			countErrors++;
		}

		//get all patient usernames from database
		ArrayList<String> usernames = patientDAO.getAllPatientUsernames(username); 
	
		//check if usernames exist
		if(pavalidator.usernameExistsMoreThanOnce(username, usernames)) {
			errorMessage += "<li>Username exists</li>";
			countErrors++;
		}

		//validate password
		if( !pavalidator.isPasswordValid( password ) ) {
			errorMessage += "<li>Password should have at least 8 characters including a lowercase letter, an uppercase letter and a number</li>";
			countErrors++;	
		}	
     
		//validate ssn
		if( !pavalidator.isSsnValid( ssn ) ) {
			errorMessage += "<li>SSN should have 9 digits</li>";
			countErrors++;
		}
	 
		//validate email
		if( !pavalidator.isValidEmailAddress( email ) ) {
			errorMessage += "<li>Email is not valid</li>";
			countErrors++;
		}

		//get all patient emails from database
		ArrayList<String> emails = patientDAO.getAllPatientEmails(email); 
	
		//check if emails exists
		if(pavalidator.emailExistsMoreThanOnce(email, emails)) {
			errorMessage += "<li>Email exists</li>";
			countErrors++;
		}

		if (countErrors > 0) {	
			errorMessage = "<ol>" + errorMessage + "</ol>";
			request.setAttribute( "error-message", errorMessage);
			%>
			<jsp:forward page="edit-patient.jsp"/>	
			<%		
		}

		patient = new Patient(id, name, surname, username, password, ssn, email);
		patientDAO.updatePatient(patient, id);

		%>
		<jsp:forward page="patient-profile.jsp"/>
		<%
	
	   //usage of custom exceptions
	}  catch(ApplicationCustomExceptionDatabase e) {
		request.setAttribute( "error-message", e.getMessage());
		%>
		<jsp:forward page="edit-patient.jsp"/>	
		<%
	}  catch(Exception e) {	
		throw new Exception( e.getMessage() );
	}
%>