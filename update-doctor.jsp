<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%
	String name = request.getParameter("doctor_name");
	String surname = request.getParameter("doctor_surname");
	String username = request.getParameter("doctor_username");
	String password = request.getParameter("doctor_password");
	String specialty = request.getParameter("doctor_specialty");
	String phone = request.getParameter("doctor_phone");
	String email = request.getParameter("doctor_email");
	String address = request.getParameter("doctor_address");
	String area = request.getParameter("doctor_area");
	
	DoctorDAO doctorDAO = new DoctorDAO();
	Doctor doctor = new Doctor('1', name, surname, username, password, specialty, phone, email, address, area);

	doctorDAO.updateDoctor(doctor);
%>

<jsp:forward page="edit-patient.jsp"/>