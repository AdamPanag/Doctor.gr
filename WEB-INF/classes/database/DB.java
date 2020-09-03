package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DB {

	/* Database connection settings, change dbName, dbusername, dbpassword */
	private final String dbServer = "195.251.249.131";
	private final String dbServerPort = "3306";
	private final String dbName = "ismgroup96";
	private final String dbusername = "ismgroup96";
	private final String dbpassword = "frk7e4";

	private Connection con = null;
	
	/**
	 * Establishes a connection with the database, initializes and returns
	 * the Connection object.
	 * 
	 * @return Connection, the Connection object
	 * @throws Exception
	 */
	public Connection getConnection() throws Exception {

		try {
			// Dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			throw new Exception("MySQL Driver error: " + e.getMessage());
		}

		try {

			con = DriverManager.getConnection("jdbc:mysql://" 
				+ dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);

			return con;

		} catch (Exception e) {
			
			// throw Exception if any error occurs
			throw new Exception("Could not establish connection with the Database Server: " 
				+ e.getMessage());
		}

	}

	/**
	 * Close database connection. It is very important to close the database connection
	 * after it is used.
	 * 
	 * @throws SQLException
	 */
	public void close() throws SQLException {

		try {

			// if connection is (still) open
			if (con != null)
				con.close(); // close the connection to the database to end database session

		} catch (SQLException e) {

			throw new SQLException("Could not close connection with the Database Server: " 
				+ e.getMessage());
		}

	}

}