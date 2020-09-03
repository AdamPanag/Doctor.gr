package database;

public class PatientDataValidator {




	public boolean isNameValid(String name) {

		return ( name == null || name.length() < 3 || name.length() > 45 ? false : true);

	}


	public boolean isSurnameValid(String surname) {

		return (surname == null || surname.length() < 3 || surname.length() > 45  ? false : true);

	}


    public boolean isSsnValid(String ssn) {

	        // contains 9 number digits
	        String ePattern = "[0-9]{9}";
	        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	        java.util.regex.Matcher m = p.matcher(ssn);

			return m.matches();
	}

	public boolean isValidEmailAddress(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}

	public boolean isUsernameValid(String username) {

			return ( username == null || username.length() < 3 || username.length() > 45 ? false : true);

	}


	public boolean isPasswordValid(String password) {

				return ( password == null || password.length() < 3 || password.length() > 45 ? false : true);

	}



	public PatientDataValidator() {

	}

}
