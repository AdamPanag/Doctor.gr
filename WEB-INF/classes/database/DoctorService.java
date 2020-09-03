package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import model.Doctor;

public class DoctorService {

	/**
	 * This method is used to authenticate a user.
	 *
	 * @param username,
	 *            String
	 * @param password,
	 *            String
	 * @return User, the User object
	 * @throws Exception,
	 *             if the credentials are not valid
	 */
	public Doctor authenticate(String username, String password) throws Exception {

		Connection con = null;
		DB db = new DB();
		String sqlQuery = " SELECT * FROM doctors WHERE username=? AND password=?; ";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Doctor doctor = null;



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


			doctor = new Doctor(rs.getInt("id"), rs.getString("name"), rs.getString("surname"),rs.getString("username"), rs.getString("password"),
					 rs.getString("email"), rs.getString("specialty"), rs.getString("area"), rs.getString("address"), rs.getString("phoneNumber"));

			rs.close();
			stmt.close();
			db.close();

			return doctor; // return the user

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if (con != null)
				con.close();

		}

	} // End of authenticate

} // End of class