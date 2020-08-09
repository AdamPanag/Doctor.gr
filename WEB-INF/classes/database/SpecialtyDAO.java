package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import model.Specialty;

public class SpecialtyDAO {
	
	public List<Specialty> getAllSpecialties() throws Exception {
		List<Specialty> specialties = new ArrayList<Specialty>();
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sqlQuery = "SELECT * FROM specialties ORDER BY name DESC;";
		
		try {		
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				specialties.add( new Specialty(rs.getInt("id"), rs.getString("name")) );				
			}

			rs.close();
			stmt.close();
			db.close();

			return specialties;
			
		} catch (Exception e) {
			
			throw new Exception("An error occured while getting specialties from database: "
								+ e.getMessage());		
		
		} finally {	
			
			if(con != null)
				con.close();						
		}		
	}
}
