<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*, java.text.*, java.time.format.*, java.time.*, java.lang.Integer" %>

<%-- restrict page access --%>
<%@ include file="patientAuthenticationGuard.jsp"%>

<%  
	Patient patient = null;
	patient = (Patient) session.getAttribute("patient-database-obj");
    DoctorDAO doctorDAO = new DoctorDAO();
    int doctorId = Integer.parseInt(request.getParameter("doctorId"));
    Doctor doctor = doctorDAO.getDoctorById(doctorId);
    
    int weeksToMove = 0;
    if(request.getParameter("weeksToMove") != null) {
    	weeksToMove = Integer.parseInt(request.getParameter("weeksToMove"));
	}
   
%>

<!DOCTYPE html>
<html>
<head>
	<title>Doctor.gr | <%=doctor.getFullName()%></title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- Custom styles for this template -->
    <link href="css/book-now.css" rel="stylesheet">
</head>

<body>

    <!-- Navigation Bar-->
	<%@ include file="navbar-patient.jsp" %>

	<%
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		LocalDateTime now = LocalDateTime.now();  
		String dt = dtf.format(now);  
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Calendar day = Calendar.getInstance();
		day.setTime(sdf.parse(dt));

		BookingDAO bookingDAO = new BookingDAO();
		ArrayList<Booking> bookingsBooked = bookingDAO.getAllBookingsByDoctorId(doctorId);
	%>
	
	<div id="doctor-info-schedule">
    	<div class="row">
    		<div class="col-lg-3">
    			<div class="doctor-info">
	    			<h2><%=doctor.getFullName()%></h2>
	    			<h3><%=doctor.getSpecialty()%></h3>
	    			<h3><%=doctor.getAddress()%></h3>
	    			<h3><%=doctor.getPhoneNumber()%></h3>
    			</div>	
    		</div>
    		<div class="col-lg-9">
				<div class="doctor-schedule" >
					<h3>Select day</h3>
					<div class="row">
						<div class="arrow" onclick="moveDate('prev', '<%=weeksToMove%>')">
							<span>&#10094;</span>
						</div>
					<!-- Week -->
				<%		
						day.add(Calendar.DATE, weeksToMove * 7);
						for(int i=0; i < 7; i++) {
							day.add(Calendar.DATE, i);
							dt = sdf.format(day.getTime());
				%>		
						
							<div class="book-day col-6 col-md-4 col-lg no-gutters">
								<span class="day"><%=dt%></span>
								<br>

								<%	
									boolean timeSlotBooked;
									Calendar time = Calendar.getInstance();
									String timeSlot = "09:00";
									SimpleDateFormat sdfHour = new SimpleDateFormat("HH:mm");
									time.setTime(sdfHour.parse(timeSlot));
									for(int j=0;j<=16;j++) {
										timeSlot = sdfHour.format(time.getTime());
										time.add(Calendar.MINUTE, 30);

										timeSlotBooked = false;
										if(bookingsBooked.size() > 0) {
											for(int k=0; k < bookingsBooked.size(); k++) {
												
												if(timeSlot.compareTo(bookingsBooked.get(k).getHour()) == 0 
													&& dt.compareTo(bookingsBooked.get(k).getDate()) == 0) {
													timeSlotBooked = true; //if this date and timeSlot is booked make it unable to be selected
													
												}
											}
										}

										if(timeSlotBooked == false) {
								%>

											<span onclick="confirmBooking('<%=doctorId%>', '<%=dt%>', '<%=timeSlot%>')" class="time"><%=timeSlot%></span>
								
								<%	
										} else {
								%>
											<span class="booked"><%=timeSlot%></span>
								<%
										}
									}
								%>
							</div>
						

				<%		day.add(Calendar.DATE, -i);
					}	
				%>	
							<div class="arrow" onclick="moveDate('next', '<%=weeksToMove%>')">
								<span>&#10095;</span>
							</div>
					</div>

				</div>
    		</div>
    	</div>
	</div>
	%>


	<script>
		function confirmBooking(doctorId, dt, timeSlot) {
		  var r = confirm("Are you sure that you want to book an appointment at " + timeSlot + " on the " + dt + "?");
		  if(r == true) {
		  	window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/booking-controller.jsp?doctorId=" + doctorId +
		  	"&date=" + dt + "&hour=" + timeSlot;
		  }
		}

		function moveDate(para , weeksToMove) {
			if(para == "prev") {
				weeksToMove--;
				window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/book-now.jsp?doctorId=1&weeksToMove=" + weeksToMove;
			} else if(para == 'next') {
				weeksToMove++;
				window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/book-now.jsp?doctorId=1&weeksToMove=" + weeksToMove;
			}
		}

	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
</body>
</html>