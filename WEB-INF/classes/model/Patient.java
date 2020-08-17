package model;

public class Patient extends User {

//    int id;
//    String name;
//    String surname;
//    String username;
//    String password;
//    String email;
    String ssn;
    String phoneNumber;

    public Patient(int id, String name, String surname, String username, String password, String ssn,
    		String phoneNumber, String email) {
        super(id, name, surname, username, password, email);
        this.ssn = ssn;
        this.phoneNumber = phoneNumber;
    }

    public Patient() {}

		public String getSsn() {
			return ssn;
		}

		public void setSsn (String ssn) {
			this.ssn = ssn;
		}

		public String getPhoneNumber() {
			return phoneNumber;
		}

		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

		@Override
			public String toString() {

				return "<ul>"
						+ "<li>name= " + name + "</li>"
						+ "<li>surname= " + surname + "</li>"
						+ "<li>username= " + username + "</li>"
						+ "<li>password= " + password + "</li>"
						+ "<li>ssn= " + ssn + "</li>"
						+ "<li>phoneNumber= " + phoneNumber + "</li>"
						+ "<li>email= " + email + "</li>"
						+ "</ul>";
	}

}