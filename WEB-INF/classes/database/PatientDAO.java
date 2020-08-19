package database;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Patient;
import model.User;

public class PatientDAO {

	public Patient getPatientInfo() throws Exception {
		Patient patient = new Patient();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sqlQuery = "SELECT * "
						+ "FROM patients "
						+ "WHERE id = '1';";

		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while (rs.next()) {
				patient = new Patient(rs.getInt("id"), rs.getString("name"),
						rs.getString("surname"), rs.getString("username"), rs.getString("password"),
						rs.getString("ssn"), rs.getString("email"));
			}


			rs.close();
			stmt.close();
			db.close();

			return patient;

		} catch (Exception e) {

			throw new Exception("An error occured while getting patients from database: "
								+ e.getMessage());

		} finally {

			if(con != null)
				con.close();
		}

	}

	public void updatePatient(Patient patient) throws Exception {


			Connection con = null;

			//Define the SQL statement (to be executed)
			String sql= "UPDATE patients " +
						"SET name=?, surname=?, username=?, password=?, ssn=?, email=? " +
						"WHERE id=1;";


			DB db = new DB();

			try {
				//open connection and get Connection object
				con = db.getConnection();

				PreparedStatement stmt = con.prepareStatement( sql );

				//set values to all parameters

				stmt.setString(1, patient.getName());
				stmt.setString(2, patient.getSurname());
				stmt.setString(3, patient.getUsername());
				stmt.setString(4, patient.getPassword());
				stmt.setString(5, patient.getSsn() );
				//stmt.setString(6, patient.getPhoneNumber());
				stmt.setString(6, patient.getEmail());

				//execute the SQL statement (INSERT)
				stmt.executeUpdate();

				//close PreparedStatement to release resources
				stmt.close();

			} catch (Exception e) {

				throw new Exception( "Error while updating patient's profile: " + e.getMessage() );

			} finally {

				if(con != null) // if connection is still open, then close.
					con.close();

			}


	} // End of updatePatient

}
