<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.lang.Integer" %>

<%	
	Patient patient = null;
	patient = (Patient) session.getAttribute("patient-database-obj");

	if(patient != null) {
		//read parameters from request
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		int pateintId = patient.getId();
		String date = request.getParameter("date");
		String hour = request.getParameter("hour");

		BookingDAO bookingDAO = new BookingDAO();

		int id = bookingDAO.findNextBookingId();

		Booking booking = new Booking(id, doctorId, pateintId, date, hour);
		bookingDAO.bookAnAppointment(booking);

		DoctorDAO doctorDAO = new DoctorDAO();
		Doctor doctor = doctorDAO.getDoctorInfo(doctorId);

%>

		<jsp:forward page="booking-done.jsp">
			<jsp:param name="doctor_full_name" value="<%=doctor.getFullName()%>" />
			<jsp:param name="date" value="<%=date%>" /> 
			<jsp:param name="hour" value="<%=hour%>" /> 
		</jsp:forward>
<%
	}
%>