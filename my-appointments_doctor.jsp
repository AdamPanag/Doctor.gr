<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*, java.time.format.*, java.time.*, java.lang.*, java.text.SimpleDateFormat" %>

<%-- restrict page access --%>
<%@ include file="doctorAuthenticationGuard.jsp"%>

<%
	Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");
	
	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	BookingDAO bookingDAO = new BookingDAO();
	
    doctor = doctorDAO.getDoctorInfo(doctor.getId());
	
	List<Booking> bookings = bookingDAO.getAllBookingsByDoctorId(doctor.getId());
	
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy"); 
	LocalDateTime now = LocalDateTime.now();  
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	Date current_date = sdf.parse(dtf.format(now));

	Calendar day = Calendar.getInstance();
	day.setTime(sdf.parse(dtf.format(now)));	
	
	String dt_this;
	
	int daysToMove;
    if(request.getParameter("daysToMove") != null) {
    	daysToMove = Integer.parseInt(request.getParameter("daysToMove"));
	} else {
		daysToMove = 0;
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
	
	<title>Doctor.gr | My Appointments</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/my-appointments_doctor.css">

</head>

<body>

	<!-- Navigation Bar-->
	<%@ include file="navbar-doctor-appointments.jsp" %>

		<!-- Page Content -->
	<div class="col-md-8 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<p class="card-tittle font-weight-bold">My Appointments</p>
				<hr>
					<div class="row">
						<div class="arrow" onclick="moveDate('prev', '<%=daysToMove%>')">
							<span>&#10094;</span>
						</div>		
						<%	day.add(Calendar.DATE, daysToMove);
							dt_this = sdf.format(day.getTime());
							
							if (daysToMove == 0) {
						%>			
						<h5>Today, <%=dt_this%></h5>
							<%} else {%>
						<h5><%=dt_this%></h5>
							<%}%>
						<br>
						<div class="arrow" onclick="moveDate('next', '<%=daysToMove%>')">
							<span>&#10095;</span>
						</div>
					</div>
			</div>
	
			<div class="container" id="appointments-list">
				<div class="row appointment">
					<div class="col-2"></div>
					<div class="col-8">
						<div class="container">
							<%	boolean flag = true;	
							if(bookings.size() == 0) {
								flag = false; %>
								<h4 id="not-found">You do not have any appointments yet!</h4>
							<% } else {
								for(Booking booking: bookings) {
									Date booking_date = new SimpleDateFormat("dd-MM-yyyy").parse(booking.getDate());
									Date this_date = new SimpleDateFormat("dd-MM-yyyy").parse(dt_this);
									if (booking_date.compareTo(this_date) == 0) { 
										flag = false; %>
										<div class="row mini-profil">
											<div class="col-5">
												<%Patient patient = patientDAO.getPatientInfo(booking.getPatientId());%>
												<h5><%=patient.getFullName()%></h5>
												<p><%=patient.getSsn()%></p>
												<p><%=patient.getEmail()%></p>
											</div>
											<div class="col-4">
												<h5><%=booking.getDate()%></h5>
												<h5><%=booking.getHour()%></h5>
												<span onclick="cancelBooking(<%=booking.getId()%>)" class="time">Cancel <i class="material-icons" style="vertical-align: -6px;">delete</i></span>
											</div>
										</div>
							<%		}
								}
							} 
							%>
							<% if (flag == true) {%>
								<h4 id="no-upcoming">Νο appointments on <%=dt_this%>!</h4>
							<%  } %>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function cancelBooking(bookingId) {
		  var r = confirm("Are you sure that you want to cancel this appointment?");
		  if(r == true) {
		  	window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/cancelation-controller.jsp?id=" + bookingId;
		  }
		}
	</script>
	
	<script>
	function moveDate(para , daysToMove) {
			if(para == "prev") {
				daysToMove--;
				window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/my-appointments_doctor.jsp?daysToMove=" + daysToMove;
			} else if(para == 'next') {
				daysToMove++;
				window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/my-appointments_doctor.jsp?daysToMove=" + daysToMove;
			}
		}
	</script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>