<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*, java.time.format.*, java.time.*, java.lang.*, java.text.SimpleDateFormat" %>

<%-- restrict page access --%>
<%@ include file="patientAuthenticationGuard.jsp"%>

<%
	Patient patient = (Patient) session.getAttribute("patient-database-obj");

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	BookingDAO bookingDAO = new BookingDAO();

	patient = patientDAO.getPatientInfo(patient.getId());
	
	List<Booking> bookings = bookingDAO.getAllBookingsByPatientId(patient.getId());
	
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy"); 
	LocalDateTime now = LocalDateTime.now();  
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	Date current_date = sdf.parse(dtf.format(now));

	Calendar day = Calendar.getInstance();
	day.setTime(sdf.parse(dtf.format(now)));	
	
	String dt_start;
	String dt_end;
	
	int weeksToMove;
    if(request.getParameter("weeksToMove") != null) {
    	weeksToMove = Integer.parseInt(request.getParameter("weeksToMove"));
	} else {
		weeksToMove = 0;
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
	
	<title>Doctor.gr | My Profile</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/patient-profile.css">

</head>

<body onload="renderDate()">

	<!-- Navigation Bar-->
	<%@ include file="navbar-patient.jsp" %>

	<!-- Page Content -->
	<div class="col-md-8 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<p class="card-title font-weight-bold">Settings</p>
				<hr>
				<p class="card-description">Personal Information</p>
				<ul class="about">
					<li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Name:</span><span class="about-item-detail"><%=patient.getName()%></span></li>
					<li class="about-items"><i class="mdi mdi-mail-ru icon-sm "></i><span class="about-item-name">Surname:</span><span class="about-item-detail"><%=patient.getSurname()%></span></li>
					<li class="about-items"><i class="mdi mdi-mail-ru icon-sm "></i><span class="about-item-name">Username:</span><span class="about-item-detail"><%=patient.getUsername()%></span></li>
					<li class="about-items"><i class="mdi mdi-lock-outline icon-sm "></i><span class="about-item-name">SSN:</span><span class="about-item-detail"><%=patient.getSsn()%></span></li>
				</ul>
				<p class="card-description">Contact Information</p>
				<ul class="about">
					<li class="about-items"><i class="mdi mdi-map-marker icon-sm "></i><span class="about-item-name">Email:</span><span class="about-item-detail"><%=patient.getEmail()%></span></li>
				</ul>
				<a href="/ismgroup96/edit-patient.jsp?id=<%=patient.getId()%>" class="btn btn-xs btn-default btn-block" title="Edit">Edit <i class="material-icons" style="vertical-align: -6px;">create</i></a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<p class="card-tittle font-weight-bold">My Appointments</p>
				<hr>
					<div class="row">
						<div class="arrow" onclick="moveDate('prev', '<%=weeksToMove%>')">
							<span>&#10094;</span>
						</div>		
						<%	day.add(Calendar.DATE, weeksToMove * 7);
							dt_start = sdf.format(day.getTime());
							day.add(Calendar.DATE, 6);
							dt_end = sdf.format(day.getTime());
							day.add(Calendar.DATE, -6);
						%>			
						<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From <%=dt_start%> to <%=dt_end%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
						<br>
						<div class="arrow" onclick="moveDate('next', '<%=weeksToMove%>')">
							<span>&#10095;</span>
						</div>
					</div>
			</div>
				
			<div class="container" id="appointments-list">
					<div class="row appointment">
					<div class="col-2"></div>
					<div class="col-8">
						<div class="container">
							<% boolean flag = true;	
							if(bookings.size() == 0) {%>
								<h4 id="not-found">You have not booked any appointments yet!</h4>
							<% } else {
								for(Booking booking: bookings) {
									Date booking_date = new SimpleDateFormat("dd-MM-yyyy").parse(booking.getDate());
									Date from_date = new SimpleDateFormat("dd-MM-yyyy").parse(dt_start);
									Date to_date = new SimpleDateFormat("dd-MM-yyyy").parse(dt_end);
									if (booking_date.compareTo(from_date) >= 0 && booking_date.compareTo(to_date) <= 0) {
										flag = false; %>
										<div class="row mini-profil">
											<div class="col-3">
												<img src="images/profile-pic.jpg" alt="profile" width="100%" height="150">
											</div>
											<div class="col-5">
												<%Doctor doctor = doctorDAO.getDoctorInfo(booking.getDoctorId());%>
												<h5><%=doctor.getFullName()%></h5>
												<p><%=doctor.getSpecialty()%></p>
												<p><%=doctor.getPhoneNumber()%></p>
												<p><%=doctor.getAddress()%></p>
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
								if (flag == true) {%>
								<h4 id="no-upcoming">Νο appointments!</h4>
							<%  } %>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<br><br><br>
			</div>
		</div>
	</div>
		
	<script>
		function cancelBooking(bookingId) {
		  var r = confirm("Are you sure that you want to cancel this appointment?");
		  if(r == true) {
		  	window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/cancellation-controller.jsp?id=" + bookingId;
		  }
		}
	</script>
	
	<script>
	function moveDate(para , weeksToMove) {
			if(para == "prev") {
				weeksToMove--;
				window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/patient-profile.jsp?weeksToMove=" + weeksToMove;
			} else if(para == 'next') {
				weeksToMove++;
				window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/patient-profile.jsp?weeksToMove=" + weeksToMove;
			}
		}
	</script>
		
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>