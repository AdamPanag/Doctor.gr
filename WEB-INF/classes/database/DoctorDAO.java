package database;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Doctor;
import model.Specialty;

public class DoctorDAO {
	
	public List<Doctor> getAllDoctorsBySpecialtyAndArea(String specialty, String area) throws Exception{
		List<Doctor> doctors = new ArrayList<Doctor>();
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sqlQuery = "SELECT * "
						+ "FROM doctors "
						+ "WHERE specialty = '" + specialty + "' "
						+ "AND area = '" + area + "';";
		
		try {		
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				doctors.add( new Doctor(rs.getInt("id"), rs.getString("name"),
						rs.getString("surname"), rs.getString("username"), rs.getString("password"),
						rs.getString("email"), rs.getString("specialty"), rs.getString("area"),
						rs.getString("address"), rs.getString("phoneNumber")));
			}

			rs.close();
			stmt.close();
			db.close();

			return doctors;
			
		} catch (Exception e) {
			
			throw new Exception("An error occured while getting doctors from database: "
								+ e.getMessage());		
		
		} finally {	
			
			if(con != null)
				con.close();						
		}		
		
	}

}
