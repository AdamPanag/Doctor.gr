<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.List" %>
<%@ page errorPage="error.jsp"%>


<%
	String username = request.getParameter("username");
    String password = request.getParameter("password");

PatientService pservice = new PatientService();

try {
	
	session.setAttribute("patient-database-obj", pservice.authenticate(username, password));
		
} catch(Exception e) {
	
	request.setAttribute("message", e.getMessage());
%>
	<jsp:forward page="client sign-up-in.jsp"/>	
<%		
}

response.sendRedirect("index.jsp");

%>	
<%--

<jsp:forward page="index.jsp"/>
--%>




