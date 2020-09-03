package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import model.Doctor;

public class DoctorRegisterService {


	public void register(Doctor doctor) throws ApplicationCustomExceptionDatabase, Exception {

		Connection con = null;
		DB db = new DB();
		String insertNewDoctorSQL = "INSERT INTO doctors "
				+ " (name, surname, username, password, specialty, phoneNumber, email, address, area) "
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";


		try {

			con = db.getConnection(); //get Connection

			PreparedStatement stmt = con.prepareStatement(insertNewDoctorSQL);


			stmt.setString(1, doctor.getName());
			stmt.setString(2, doctor.getSurname());
			stmt.setString(3, doctor.getUsername());
			stmt.setString(4, doctor.getPassword());
			stmt.setString(5, doctor.getSpecialty());
			stmt.setString(6, doctor.getPhoneNumber());
			stmt.setString(7, doctor.getEmail());
		    stmt.setString(8, doctor.getAddress());
			stmt.setString(9, doctor.getArea());

			stmt.executeUpdate();

			stmt.close();
			db.close(); //close connection

		} catch (SQLIntegrityConstraintViolationException  e) {
			// if am or email already registered
			throw new ApplicationCustomExceptionDatabase("Doctor already exists.");

		} catch (SQLException e) {

			throw new Exception(e.getMessage());

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			if(con != null) // if connection is still open, then close.
				con.close();

		}

	}// End of register


	//public List<Student> getStudents(String orderByColumn, String orderByDirection) throws Exception {

		//Connection con = null;

		/*
		 * Builds the sql query
		 */
		//String sql = "SELECT * FROM students_lesson6_2019_2020 "
				//+ "LEFT JOIN departments_lesson6_2019_2020 "
				//+ "ON students_lesson6_2019_2020.department_id = departments_lesson6_2019_2020.id ";

		//if (orderByColumn != null && orderByDirection != null) {
		//	//sql += " ORDER BY " + orderByColumn + " " + orderByDirection;
		//}

		//DB db = new DB();
		//List<Doctor> doctors =  new ArrayList<Doctor>();

		//try {
			// open connection and get Connection object
			//con = db.getConnection();

			//PreparedStatement stmt = con.prepareStatement(sql);

			// execute the SQL statement (QUERY - SELECT) and get the results in a ResultSet)
			//ResultSet rs = stmt.executeQuery();

			//while (rs.next()) {

				//Specialty sp = new Specialty( rs.getInt("specialties.id"),
									//rs.getString("specialties.name") );

               // Area ar = new Area( rs.getInt("specialties.id"),
									//rs.getString("specialties.name") );
				//Doctor do = new Doctor( rs.getString("students_lesson6_2019_2020.am"),
									//rs.getString("students_lesson6_2019_2020.name"),
									//rs.getString("students_lesson6_2019_2020.surname"),
									//rs.getString("students_lesson6_2019_2020.email"),
									//rs.getString("students_lesson6_2019_2020.phone"),
									//dp, rs.getBoolean("students_lesson6_2019_2020.receive_notification") );

				//students.add( st );

			//}

 			//rs.close(); //closing ResultSet
			//stmt.close(); //closing PreparedStatement

			//return students;

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
	public void updateDoctor(Doctor doctor) throws ApplicationCustomExceptionDatabase, Exception {


		Connection con = null;

		//Define the SQL statement (to be executed)


        String sql= "UPDATE doctors SET name=?, surname=?, username=?, password=?, specialty=?, phoneNumber=?, email=?, address=?, area=?" +
        "WHERE id=1;";

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
			stmt.setString(5, doctor.getSpecialty());
			stmt.setString(6, doctor.getPhoneNumber());
			stmt.setString(7, doctor.getEmail());
			stmt.setString(8, doctor.getAddress());
			stmt.setString(9, doctor.getArea());

			//execute the SQL statement (INSERT)
			stmt.executeUpdate();

			//close PreparedStatement to release resources
			stmt.close();

		} catch (SQLIntegrityConstraintViolationException  e) {
			// if am or email already registered
			throw new ApplicationCustomExceptionDatabase("Email is used");

		} catch (Exception e) {

			throw new Exception( "Error while updating doctor: " + e.getMessage() );

		} finally {

			if(con != null) // if connection is still open, then close.
				con.close();

		}


	} // End of updateStudent



}