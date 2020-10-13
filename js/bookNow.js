function confirmBooking(doctorId, dt, timeSlot) {
 	var r = confirm("Are you sure that you want to book an appointment at " + timeSlot + " on the " + dt + "?");
	if(r == true) {
  		window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/booking-controller.jsp?doctorId=" + doctorId
  							 + "&date=" + dt + "&hour=" + timeSlot;
  	}
}

function moveDate(para, doctorId, weeksToMove) {
	if(para == "prev") {
		weeksToMove--;
		if(weeksToMove < 0) {
			weeksToMove = 0;
		}
		window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/book-now.jsp?doctorId=" + doctorId + "&weeksToMove=" + weeksToMove;
	} else if(para == 'next') {
		weeksToMove++;
		window.location.href = "http://ism.dmst.aueb.gr/ismgroup96/book-now.jsp?doctorId=" + doctorId + "&weeksToMove=" + weeksToMove;
	}
}
