<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.lang.Integer" %>

<%
	//read parameters from request
	int doctorId = Integer.parseInt(request.getParameter("doctorId"));
	int pateintId = 1; //for now
	String date = request.getParameter("date");
	String hour = request.getParameter("hour");

	BookingDAO bookingDAO = new BookingDAO();

	int id = bookingDAO.findNextBookingId();

	Booking booking = new Booking(id, doctorId, pateintId, date, hour);
	bookingDAO.bookAnAppointment(booking);
%>