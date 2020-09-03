package database;

public class DoctorDataValidator {



	public boolean isNameeValid(String name) {

		return ( name == null || name.length() < 3 || name.length() > 45 ? false : true);

	}


	public boolean isSurnameeValid(String surname) {

		return (surname == null || surname.length() < 3 || surname.length() > 45  ? false : true);

	}
	public boolean isUsernameeValid(String username) {

			return (username == null || username.length() < 3 || username.length() > 45  ? false : true);

	}


	public boolean isValidEmail(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}


	public boolean isValidPhoneNumber(String phoneNumber) {
		// Rules:
		// 1) Starts with 21 or 22 or 69
        // 2) Then contains 8 digits (10 digits total).
		String ePattern = "^(21|22|69)[0-9]{8}";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(phoneNumber);

		return m.matches();

	}
    public boolean isPassworddValid(String password) {

                    return password.matches(
						"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" );
		}


     public boolean isValidAddress( String address )
	  {
	      return address.matches(
	         "\\d+\\s+([a-zA-Z]+|[a-zA-Z]+\\s[a-zA-Z]+)" );
      }





	public DoctorDataValidator() {

	}

}
