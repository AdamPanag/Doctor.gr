package model;

public class TimeSlot {
	
	private int doctorId;
	private String date;
	private String hour;
	private boolean booked;

	public TimeSlot(int doctorId, String date, String hour, boolean booked) {
		this.doctorId = doctorId;
		this.date = date;
		this.hour = hour;
		this.booked = booked;
	}
	
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public boolean isBooked() {
		return booked;
	}
	public void setBooked(boolean booked) {
		this.booked = booked;
	}
}
