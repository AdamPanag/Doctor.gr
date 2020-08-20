package database;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Area;
import model.Booking;

public class BookingDAO {

	/**
	 * Calculates the number of bookings that already exist plus one,
	 * in order to give the next bookings the right id.
	 * For example, if there are 5 bookings, this method will return the number 6,
	 * which is the id of the next booking.
	 */
	public int findNextBookingId() throws Exception {
		int id = 1;

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sqlQuery = "SELECT id FROM bookings;";

		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while (rs.next()) {
				id++;
			}

			rs.close();
			stmt.close();
			db.close();

			return id;

		} catch (Exception e) {

			throw new Exception("An error occured while getting bookings id from database: "
								+ e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}
	}

	public void bookAnAppointment(Booking booking) throws Exception {
		Connection con = null;
		DB db = new DB();
		String insertNewStudentSQL = "INSERT INTO bookings "
				+ "(id, doctorId, patientId, date, hour) "
				+ "VALUES (?, ?, ?, ?, ?);";

		try {

			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(insertNewStudentSQL);

			stmt.setInt(1, booking.getId());
			stmt.setInt(2, booking.getDoctorId());
			stmt.setInt(3, booking.getPatientId());
			stmt.setString(4, booking.getDate());
			stmt.setString(5, booking.getHour());

			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection

		} catch (SQLException e) {

			throw new Exception(e.getMessage());

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if(con != null) // if connection is still open, then close.
				con.close();

		}
	}

	public ArrayList<Booking> getAllBookingsByDoctorId(int doctorId) throws Exception{
		ArrayList<Booking> bookings = new ArrayList<Booking>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sqlQuery = "SELECT * FROM bookings "
						+ "WHERE doctorId = '" + doctorId + "';";

		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while (rs.next()) {
				bookings.add(new Booking(rs.getInt("id"), rs.getInt("doctorId"), rs.getInt("patientId"),
										 rs.getString("date"), rs.getString("hour")));
			}

			rs.close();
			stmt.close();
			db.close();

			return bookings;

		} catch (Exception e) {

			throw new Exception("An error occured while getting bookings by doctor id from database: "
								+ e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}
	}

	public ArrayList<Booking> getAllBookingsByPatientId(int patientId) throws Exception{
		ArrayList<Booking> bookings = new ArrayList<Booking>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sqlQuery = "SELECT * FROM bookings "
								+ "WHERE patientId = '" + patientId + "';";

		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while (rs.next()) {
				bookings.add(new Booking(rs.getInt("id"), rs.getInt("doctorId"), rs.getInt("patientId"), rs.getString("date"), rs.getString("hour")));
			}

			rs.close();
			stmt.close();
			db.close();

			return bookings;

		} catch (Exception e) {
			throw new Exception("An error occured while getting bookings by patient id from database: " + e.getMessage());
		} finally {
			if(con != null)
				con.close();
		}
	}

}
