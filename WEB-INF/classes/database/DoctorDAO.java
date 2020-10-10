package database;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Doctor;
import model.Specialty;
import model.User;

public class DoctorDAO {

	public List<Doctor> getAllDoctorsBySpecialtyAndArea(String specialty, String area) throws Exception{
		List<Doctor> doctors = new ArrayList<Doctor>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sqlQuery;

		if(specialty != "" && area != "") {
			sqlQuery = "SELECT * "
					 + "FROM doctors "
					 + "WHERE specialty = '" + specialty + "' "
					 + "AND area = '" + area + "';";

		} else if(specialty != "") {
			sqlQuery = "SELECT * "
					 + "FROM doctors "
					 + "WHERE specialty = '" + specialty + "';";

		} else if(area != "") {
			sqlQuery = "SELECT * "
					 + "FROM doctors "
					 + "WHERE area = '" + area + "';";

		} else {
			sqlQuery = "SELECT * "
					 + "FROM doctors " + ";";

		}

		try {
			con = db.getConnection(); //get Connection
			stmt = con.prepareStatement(sqlQuery);
			rs = stmt.executeQuery();

			while (rs.next()) {
				doctors.add( new Doctor(rs.getInt("id"), rs.getString("name"),
						rs.getString("surname"), rs.getString("username"), rs.getString("password"),
						rs.getString("specialty"), rs.getString("phoneNumber"), rs.getString("email"),
						rs.getString("address"), rs.getString("area")));
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

	public Doctor getDoctorInfo(int id) throws Exception {
			Doctor doctor = new Doctor();

			DB db = new DB();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			String sqlQuery = "SELECT * "
							+ "FROM doctors "
							+ "WHERE id = '" + id + "';";

			try {
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sqlQuery);
				rs = stmt.executeQuery();

				while (rs.next()) {
					doctor = new Doctor(rs.getInt("id"), rs.getString("name"), rs.getString("surname"),
					rs.getString("username"), rs.getString("password"), rs.getString("specialty"),
					rs.getString("phoneNumber"), rs.getString("email"), rs.getString("address"),
					rs.getString("area"));
				}


				rs.close();
				stmt.close();
				db.close();

				return doctor;

			} catch (Exception e) {

				throw new Exception("An error occured while getting doctors from database: "
									+ e.getMessage());

			} finally {

				if(con != null)
					con.close();
			}

	}

	public void updateDoctor(Doctor doctor, int id) throws Exception {


				Connection con = null;

				//Define the SQL statement (to be executed)
				String sql= "UPDATE doctors " +
							"SET name=?, surname=?, username=?, password=?, specialty=?, phoneNumber=?, email=?, address=?, area=? " +
							"WHERE id = '" + id + "';";


				DB db = new DB();

				try {
					//open connection and get Connection object
					con = db.getConnection();

					PreparedStatement stmt = con.prepareStatement( sql );

					//set values to all parameters

					stmt.setString(1, doctor.getName());
					stmt.setString(2, doctor.getSurname());
					stmt.setString(3, doctor.getUsername());
					stmt.setString(4, doctor.getPassword());
					stmt.setString(5, doctor.getSpecialty() );
					stmt.setString(6, doctor.getPhoneNumber());
					stmt.setString(7, doctor.getEmail());
					stmt.setString(8, doctor.getAddress());
					stmt.setString(9, doctor.getArea());


					//execute the SQL statement (INSERT)
					stmt.executeUpdate();

					//close PreparedStatement to release resources
					stmt.close();

				} catch (Exception e) {

					throw new Exception( "Error while updating doctor's profile: " + e.getMessage() );

				} finally {

					if(con != null) // if connection is still open, then close.
						con.close();

				}


	} // End of updateDoctor



	public ArrayList<String> getAllDoctorEmails(String email) throws Exception {
			ArrayList<String> emails = new ArrayList<String>();

			DB db = new DB();
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			String sqlQuery = "SELECT email "
							+ "FROM doctors;";

			try {
				con = db.getConnection(); //get Connection
				stmt = con.prepareStatement(sqlQuery);
				rs = stmt.executeQuery();

				while (rs.next()) {
					emails.add(rs.getString("email"));
				}


				rs.close();
				stmt.close();
				db.close();

				return emails;

			} catch (Exception e) {

				throw new Exception("An error occured while getting doctor emails from database: "
									+ e.getMessage());

			} finally {

				if(con != null)
					con.close();
			}

		}



		public ArrayList<String> getAllDoctorUsernames(String username) throws Exception {
					ArrayList<String> usernames = new ArrayList<String>();

					DB db = new DB();
					Connection con = null;
					PreparedStatement stmt = null;
					ResultSet rs = null;

					String sqlQuery = "SELECT username "
									+ "FROM doctors;";

					try {
						con = db.getConnection(); //get Connection
						stmt = con.prepareStatement(sqlQuery);
						rs = stmt.executeQuery();

						while (rs.next()) {
							usernames.add(rs.getString("username"));
						}


						rs.close();
						stmt.close();
						db.close();

						return usernames;

					} catch (Exception e) {

						throw new Exception("An error occured while getting doctor usernames from database: "
											+ e.getMessage());

					} finally {

						if(con != null)
							con.close();
					}

		}


}
