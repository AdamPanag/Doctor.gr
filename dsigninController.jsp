<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>
<%@ page errorPage="error.jsp"%>


<%
	String username = request.getParameter("username");
    String password = request.getParameter("password");

DoctorService dservice = new DoctorService();

try {
	
	session.setAttribute("doctor-database-obj", dservice.authenticate(username, password));
		
} catch(Exception e) {
	
	request.setAttribute("message", e.getMessage());
%>
	<jsp:forward page="doctor sign-up-in.jsp"/>	
<%		
}

response.sendRedirect("my-appointments_doctor.jsp");

%>	
<%--
Used in Lesson5
<jsp:forward page="index.jsp"/>
--%>