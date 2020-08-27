<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%
	Patient patient = (Patient) session.getAttribute("patient-database-obj");
	int id = patient.getId();

	String name = request.getParameter("patient_name");
	String surname = request.getParameter("patient_surname");
	String username = request.getParameter("patient_username");
	String password = request.getParameter("patient_password");
	String ssn = request.getParameter("patient_ssn");
	String email = request.getParameter("patient_email");

	PatientDAO patientDAO = new PatientDAO();
	patient = new Patient(id, name, surname, username, password, ssn, email);

	patientDAO.updatePatient(patient, id);
%>

<jsp:forward page="patient-profile.jsp"/>



