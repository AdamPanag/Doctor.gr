<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%
	String name = request.getParameter("patient_name");
	String surname = request.getParameter("patient_surname");
	String username = request.getParameter("patient_username");
	String password = request.getParameter("patient_password");
	String ssn = request.getParameter("patient_ssn");
	String phone = request.getParameter("patient_phone");
	String email = request.getParameter("patient_email");

	PatientDAO patientDAO = new PatientDAO();
	Patient patient = new Patient('1', name, surname, username, password, ssn, phone, email);

	patientDAO.updatePatient(patient);
%>

<jsp:forward page="edit-patient.jsp"/>



