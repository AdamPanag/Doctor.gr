package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import model.Area;

public class AreaDAO {
	
	public List<Area> getAllAreas() throws Exception {
		List<Area> areas = new ArrayList<Area>();
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sqlQuery = "SELECT * FROM areas ORDER BY name ASC;";
		
		try {		
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				areas.add( new Area(rs.getInt("id"), rs.getString("name")) );				
			}

			rs.close();
			stmt.close();
			db.close();

			return areas;
			
		} catch (Exception e) {
			
			throw new Exception("An error occured while getting areas from database: "
								+ e.getMessage());		
		
		} finally {	
			
			if(con != null)
				con.close();						
		}		
	}
}
