<%
	if(session.getAttribute("user-obj") == null) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");
%>
	<jsp:forward page="login_lesson6.jsp" />
	
<%  } %>