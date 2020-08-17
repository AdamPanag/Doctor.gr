package database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

}
