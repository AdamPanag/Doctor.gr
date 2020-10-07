package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Doctor;

public class DoctorDataValidator {


    /* A method to validate doctor's Name. */

	public boolean isNameeValid(String name) {

		return ( name == null || name.length() < 3 || name.length() > 45 ? false : true);

	}

    /* A method to validate doctor's Surname. */

	public boolean isSurnameeValid(String surname) {

		return (surname == null || surname.length() < 3 || surname.length() > 45  ? false : true);

	}

	/* A method to validate doctor's Username. */

	public boolean isUsernameeValid(String username) {

			return (username == null || username.length() < 3 || username.length() > 45  ? false : true);

	}

    /* A method to check if  doctor's Username exists. */


	public boolean usernameExists(String username, ArrayList<String> usernames) {
				boolean exists = false;

				for(int i = 0; i < usernames.size(); i++) {
					if (username.equals(usernames.get(i))) {
						exists = true;
					}
				}

				return exists;
			}


   	/* A method to validate doctor's Email. */

	public boolean isValidEmail(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}

    /* A method to check if  doctor's Emaiil exists. */

	public boolean emailExists(String email, ArrayList<String> emails) {
			boolean exists = false;

			for(int i = 0; i < emails.size(); i++) {
				if (email.equals(emails.get(i))) {
					exists = true;
				}
			}

			return exists;
		}


    /* A method to validate doctor's Phone Number. */

	public boolean isValidPhoneNumber(String phoneNumber) {
		// Rules:
		// 1) Starts with 21 or 22 or 69
        // 2) Then contains 8 digits (10 digits total).
		String ePattern = "^(21|22|69)[0-9]{8}";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(phoneNumber);

		return m.matches();

	}

    /* A method to validate doctor's Password. */

    public boolean isPassworddValid(String password) {

                    return password.matches(
						"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" );
		}


	/* A method to validate doctor's Address. */

     public boolean isValidAddress( String address )
	  {
	      return address.matches(
	         "\\d+\\s+([a-zA-Z]+|[a-zA-Z]+\\s[a-zA-Z]+)" );
      }





	public DoctorDataValidator() {

	}

}
