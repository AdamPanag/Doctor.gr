package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Patient;

public class PatientDataValidator {

    /* A method to validate patient's Name. */
	public boolean isNameValid(String name) {

		return ( name == null || name.length() < 3 || name.length() > 45 ? false : true);

	}

    /* A method to validate patient's SurName. */

	public boolean isSurnameValid(String surname) {

		return (surname == null || surname.length() < 3 || surname.length() > 45  ? false : true);

	}


    /* A method to validate patient's SSN. */

    public boolean isSsnValid(String ssn) {

	        // contains 9 number digits
	        String ePattern = "[0-9]{9}";
	        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	        java.util.regex.Matcher m = p.matcher(ssn);

			return m.matches();
	}


	/* A method to validate patient's Email Address. */

	public boolean isValidEmailAddress(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}


    /* A method to check if  patient's Emaiil exists. */

	public boolean emailExists(String email, ArrayList<String> emails) {
		boolean exists = false;

		for(int i = 0; i < emails.size(); i++) {
			if (email.equals(emails.get(i))) {
				exists = true;
			}
		}

		return exists;
	}

	public boolean emailExistsMoreThanOnce(String email, ArrayList<String> emails) {
				boolean existsMoreThanOnce = false;
				int counter = 0;

				for(int i = 0; i < emails.size(); i++) {
					if (email.equals(emails.get(i))) {
						counter++;
					}
				}

				if (counter > 1) {
					existsMoreThanOnce = true;
				}

				return existsMoreThanOnce;
	}


	/* A method to validate patient's Username. */


	public boolean isUsernameValid(String username) {

			return ( username == null || username.length() < 3 || username.length() > 45 ? false : true);

	}

    /* A method to check if  patient's Username exists. */

	public boolean usernameExists(String username, ArrayList<String> usernames) {
			boolean exists = false;

			for(int i = 0; i < usernames.size(); i++) {
				if (username.equals(usernames.get(i))) {
					exists = true;
				}
			}

			return exists;
	}

	public boolean usernameExistsMoreThanOnce(String username, ArrayList<String> usernames) {
			boolean existsMoreThanOnce = false;
			int counter = 0;

			for(int i = 0; i < usernames.size(); i++) {
				if (username.equals(usernames.get(i))) {
					counter++;
				}
			}

			if (counter > 1) {
				existsMoreThanOnce = true;
			}

			return existsMoreThanOnce;
	}

   	/* A method to validate patient's Password. */

	public boolean isPasswordValid(String password) {

                return password.matches(
					"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" );

	}



	public PatientDataValidator() {

	}

}
