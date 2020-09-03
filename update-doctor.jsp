<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>
<%@ page errorPage="error.jsp"%>

<%-- restrict page access --%>
<%@ include file="doctorAuthenticationGuard.jsp"%>

<%
	Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");
	int id = doctor.getId();

	String name = request.getParameter("doctor_name");
	String surname = request.getParameter("doctor_surname");
	String username = request.getParameter("doctor_username");
	String password = request.getParameter("doctor_password");
	String specialty = request.getParameter("doctor_specialty");
	String phone = request.getParameter("doctor_phone");
	String email = request.getParameter("doctor_email");
	String address = request.getParameter("doctor_address");
	String area = request.getParameter("doctor_area");

	SpecialtyDAO specialtyDAO = new SpecialtyDAO();
	AreaDAO areaDAO = new AreaDAO();

	DoctorDataValidator dovalidator = new DoctorDataValidator();

	int countErrorss = 0;
	String errorMessagee = "";
	
	DoctorDAO doctorDAO = new DoctorDAO();

	//Validate data using DoctorDataValidator
	try {

		if(name != null) {
			name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
		}
	
		//validate name
		if( !dovalidator.isNameeValid( name ) ) {
			errorMessagee += "<li>Name should have from 3 (min) to 45 (max) characters</li>";
			countErrorss++;
		}
	
		if(surname != null) {
			surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
		}	
	
		//validate surname
		if( !dovalidator.isSurnameeValid( surname ) ) {
			errorMessagee += "<li>Surname should have from 3 (min) to 45 (max) characters</li>";
			countErrorss++;
		}

		if(username != null) {
			username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
		}	
	
		//validate username
		if( !dovalidator.isUsernameeValid( username ) ) {
			errorMessagee += "<li>Username should have from 3 (min) to 45 (max) characters</li>";
			countErrorss++;
		}

		//validate password
		if( !dovalidator.isPassworddValid( password ) ) {
			errorMessagee += "<li>Password should have at least 8 characters including a lowercase letter, an uppercase letter and a number</li>";
			countErrorss++;	
		}

		//validate phone
		if( !dovalidator.isValidPhoneNumber( phone ) ) {
			errorMessagee += "<li>Phone Number is not valid (should starts with 21 or 22 or 69 and has 10 total digits)</li>";
			countErrorss++;
		}		

		//validate email
		if( !dovalidator.isValidEmail( email ) ) {
			errorMessagee += "<li>Email is not valid</li>";
			countErrorss++;
		}
	
		if( !dovalidator.isValidAddress( address ) ) {
			errorMessagee += "<li> Address is not valid </li>";
			countErrorss++;
		}

		if (countErrorss > 0) {
			errorMessagee = "<ol>" + errorMessagee + "</ol>";
			request.setAttribute( "error-message", errorMessagee);
			%>
			<jsp:forward page="edit-doctor.jsp"/>
			<%
		}

		doctor = new Doctor(id, name, surname, username, password, specialty, phone, email, address, area);
		doctorDAO.updateDoctor(doctor, id);

		%>
		<jsp:forward page="doctor-profile.jsp"/>
		<%

		//usage of custom exceptions
	}  catch(ApplicationCustomExceptionDatabase e) {
		request.setAttribute( "error-message", e.getMessage());
		%>
		<jsp:forward page="edit-doctor.jsp"/>
		<%
	}  catch(Exception e) { 
		throw new Exception( e.getMessage() ); 
	}
%>
