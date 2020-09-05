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

public class PatientRegisterService {

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
