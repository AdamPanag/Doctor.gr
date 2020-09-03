package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import model.Patient;

/**
 * Provides the necessary methods related to Students.
 *
 * @author sofos@aueb.gr
 *
 */
public class PatientRegisterService {

	/**
	 * Register/Save a Student to the database.
	 *
	 * @param student, Student
	 * @throws ApplicationCustomExceptionLesson6: if student is already registered.
	 * @throws Exception: if any other error occurred.
	 */
	public void register(Patient patient) throws ApplicationCustomExceptionDatabase, Exception {

		Connection con = null;
		DB db = new DB();
		String insertNewPatientSQL = "INSERT INTO patients "
				+ " (name, surname, ssn, username, password, email) "
				+ " VALUES (?, ?, ?, ?, ?, ?);";

		try {

			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(insertNewPatientSQL);


			stmt.setString(1, patient.getName());
			stmt.setString(2, patient.getSurname());
			stmt.setString(3, patient.getSsn());
			stmt.setString(4, patient.getUsername());
			stmt.setString(5, patient.getPassword());
			stmt.setString(6, patient.getEmail());



			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection

		} catch (SQLIntegrityConstraintViolationException  e) {
			// if am or email already registered
			throw new ApplicationCustomExceptionDatabase("Patient already exists.");

		} catch (SQLException e) {

			throw new Exception(e.getMessage());

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if(con != null) // if connection is still open, then close.
				con.close();

		}

	}// End of register

	/**
	 * A method to get all registered students.
	 *
	 * @return List<Student>, The List with all Students
	 * @throws Exception: if any error occurred.
	 */
	//public List<Patient> getPatients(String orderByColumn, String orderByDirection) throws Exception {

		//Connection con = null;

		/*
		 * Builds the sql query
		 */
		//String sql = "SELECT * FROM patients "
			     //  + "LEFT JOIN patients "
				//+ "ON students_lesson6_2019_2020.department_id = departments_lesson6_2019_2020.id ";

		//if (orderByColumn != null && orderByDirection != null) {
			//sql += " ORDER BY " + orderByColumn + " " + orderByDirection;
		//}

		//DB db = new DB();
		//List<Patient> patients =  new ArrayList<Patient>();

		//try {
			// open connection and get Connection object
			//con = db.getConnection();

			//PreparedStatement stmt = con.prepareStatement(sql);

			// execute the SQL statement (QUERY - SELECT) and get the results in a ResultSet)
			//ResultSet rs = stmt.executeQuery();

			//while (rs.next()) {


				//patient = new Patient(rs.getInt("id"), rs.getString("name"),
								//rs.getString("surname"), rs.getString("username"), rs.getString("password"),
								//rs.getString("ssn"), rs.getString("email"));




			//}

 			//rs.close(); //closing ResultSet
			//stmt.close(); //closing PreparedStatement

			//return patients;

		//} catch (Exception e) {

			//throw new Exception(e.getMessage());

		//} finally {

			//if(con != null) // if connection is still open, then close.
				//con.close();

		//}

	//} //End of getStudents

	/**
	 * Update Student's data to database.
	 *
	 * @param student, Student
	 * @throws ApplicationCustomExceptionLesson6: if email is used.
	 * @throws Exception: if any other error occurred.
	 */
	public void updatePatient(Patient patient) throws ApplicationCustomExceptionDatabase, Exception {


				Connection con = null;

				//Define the SQL statement (to be executed)
				String sql= "UPDATE patients" +
							"SET name=?, surname=?, username=?, password=?, ssn=?, email=?" +
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
					stmt.setString(5, patient.getSsn());
					stmt.setString(6, patient.getEmail());

					//execute the SQL statement (INSERT)
					stmt.executeUpdate();

					//close PreparedStatement to release resources
					stmt.close();

				}  catch (SQLIntegrityConstraintViolationException  e) {
			// if am or email already registered
			throw new ApplicationCustomExceptionDatabase("Email is used");


				}  catch (Exception e) {

					throw new Exception( "Error while updating patient: " + e.getMessage() );

				} finally {

					if(con != null) // if connection is still open, then close.
						con.close();

				}


		} // End of updateStudent





}
