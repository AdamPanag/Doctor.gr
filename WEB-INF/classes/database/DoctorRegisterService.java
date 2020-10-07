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

			throw new ApplicationCustomExceptionDatabase("Email is used");

		} catch (Exception e) {

			throw new Exception( "Error while updating doctor: " + e.getMessage() );

		} finally {

			if(con != null) // if connection is still open, then close.
				con.close();

		}


	} // End of updateStudent



}