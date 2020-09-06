<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.lang.Integer" %>

<%	
	int appointmentId = Integer.parseInt(request.getParameter("id"));
	
	BookingDAO bookingDAO = new BookingDAO();
	bookingDAO.cancelAnAppointment(appointmentId);
%>

		<jsp:forward page="patient-profile.jsp" />