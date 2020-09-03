<%
	if(session.getAttribute("doctor-database-obj") == null) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");
%>
	<jsp:forward page="index.jsp" />
	
<%  } %>