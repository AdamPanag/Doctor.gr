<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.lang.Integer" %>

<%
	if((session.getAttribute("doctor-database-obj") == null && session.getAttribute("patient-database-obj") == null) || (request.getParameter("id") == null)) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");
%>
	<jsp:forward page="index.jsp" />
	
<%  } %>

<%	
	int appointmentId = Integer.parseInt(request.getParameter("id"));
	
	BookingDAO bookingDAO = new BookingDAO();
	bookingDAO.cancelAnAppointment(appointmentId);
	
	if (session.getAttribute("patient-database-obj") != null) {
%>
		<jsp:forward page="patient-profile.jsp" />
<%
	} else {
%>
		<jsp:forward page="my-appointments_doctor.jsp" />
	<% } %>
