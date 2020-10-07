package model;

public class Booking {
	
	private int id;
	private int doctorId;
	private int patientId;
	private String date;
	private String hour;
	
	public Booking(int id, int doctorId, int patientId, String date, String hour) {
		this.id = id;
		this.doctorId = doctorId;
		this.patientId = patientId;
		this.date = date;
		this.hour = hour;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getDate() {
		return date;
	}
	
	public String getDateReverse() {
		String dateR = "";
		for (int i = date.length() - 1; i >= 0; i--) {
			dateR += date.charAt(i);
		}
		
		return dateR;
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
}
