<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*, java.time.format.*, java.time.*, java.lang.*, java.text.SimpleDateFormat" %>

<%
	Patient patient = (Patient) session.getAttribute("patient-database-obj");

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	BookingDAO bookingDAO = new BookingDAO();

	patient = patientDAO.getPatientInfo(patient.getId());
	
	List<Booking> bookings = bookingDAO.getAllBookingsByPatientId(patient.getId());
	
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy"); 
	LocalDateTime now = LocalDateTime.now();  
	String dt = dtf.format(now);
	Date current_date = new SimpleDateFormat("dd-MM-yyyy").parse(dt);

	//sort bookings by order
	List<Booking> bookingsSorted;
	String newDateString1;
	String newDateString2;
	SimpleDateFormat sdfHour = new SimpleDateFormat("dd-MM-yyyy HH:mm");

	// for (int i = 0; i < bookings.size(); i++) {
	// 	newDateString = bookings.get(i).getDate() + " " + bookings.get(i).getHour();
	// 	bookings.get(i).setDate(sdfHour.parse(newDateString));
	// }

	// Booking o1;
	// Booking o3;
	// for (int i = 0; i < bookings.size() - 1; i++) {
	// 	//o1 = bookings.get(i);
	// 	newDateString1 = bookings.get(i).getDate() + " " + bookings.get(i).getHour();
	// 	//o3 = bookings.get(i + 1);
	// 	newDateString2 = bookings.get(i + 1).getDate() + " " + bookings.get(i + 1).getHour();

	// 	bookings.sort((o1, o3) --> sdfHour.parse(newDateString1).compareTo(sdfHour.parse(newDateString2)));
	// }

	// Collections.sort(bookings, new Comparator<Booking>() {

	// 	SimpleDateFormat sdfHour = new SimpleDateFormat("dd-MM-yyyy HH:mm");
 //  		public int compare(Booking o1, Booking o2) {

 //      		return sdfHour.parse(o1.getDate() + " " + o1.getHour()).compareTo(sdfHour.parse(o2.getDate() + " " + o2.getHour()));
 //  		}
	// });
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
					<li class="about-items"><i class="mdi mdi-lock-outline icon-sm "></i><span class="about-item-name">Password:</span><span class="about-item-detail" type="password"><%=patient.getPassword()%></span></li>
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
				<div class="wrapper">
					<div class="calendar">
						<div class="month">
							<div class="prev" onclick="moveDate('prev')">
								<span>&#10094;</span>
							</div>
							<div>
								<h2 id="month"></h2>
								<p id="date_str"></p>
							</div>
							<div class="next" onclick="moveDate('next')">
								<span>&#10095;</span>
							</div>
						</div>
						<div class="weekdays">
							<div>Sun</div>
							<div>Mon</div>
							<div>Tue</div>
							<div>Wed</div>
							<div>Thu</div>
							<div>Fri</div>
							<div>Sat</div>
						</div>
						<div class="days"></div>
					</div>
				</div>
				<script src="js/calendar.js"></script>
			</div>
			<div class="container" id="appointments-list">
				<div class="row appointment">
					<div class="col-2"></div>
					<div class="col-8">
						<div class="container">
							<%	if(bookings.size() == 0) {%>
								<h4 id="not-found">You have not booked any appointments yet!</h4>
							<% } else {
								for(Booking booking: bookings) {
									Date booking_date = new SimpleDateFormat("dd-MM-yyyy").parse(booking.getDate());
									if (booking_date.compareTo(current_date) >= 0) {%>
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
							} %>
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
		
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>