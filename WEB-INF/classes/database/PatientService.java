package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import model.Patient;

public class PatientService {

	/**
	 * This method is used to authenticate a patient.
	 *
	 * @param username,
	 *            String
	 * @param password,
	 *            String
	 * @return Patient, the Patient object
	 * @throws Exception,
	 *             if the credentials are not valid
	 */
	public Patient authenticate(String username, String password) throws Exception {

		Connection con = null;
		DB db = new DB();
		String sqlQuery = " SELECT * FROM patients WHERE username=? AND password=?; ";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Patient patient = null;



		try {

			con = db.getConnection(); // get Connection

			stmt = con.prepareStatement(sqlQuery);

			stmt.setString(1, username);
			stmt.setString(2, password);


			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();

				throw new Exception("Wrong username or password");

			}


			patient = new Patient(rs.getInt("id"), rs.getString("name"), rs.getString("surname"),rs.getString("username"), rs.getString("password"),
					rs.getString("ssn"), rs.getString("email"));

			rs.close();
			stmt.close();
			db.close();

			return patient; // return the patient

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if (con != null)
				con.close();

		}

	} // End of authenticate

} // End of class
