package model;

public class Patient extends User {

//    int id;
//    String name;
//    String surname;
//    String username;
//    String password;
//    String email;
    String ssn;
    //String phoneNumber;

    public Patient(int id, String name, String surname, String username, String password, String ssn,
    		 String email) {
        super(id, name, surname, username, password, email);
        this.ssn = ssn;

    }

    public Patient() {}

		public String getSsn() {
			return ssn;
		}

		public void setSsn (String ssn) {
			this.ssn = ssn;
		}



		@Override
			public String toString() {

				return "<ul>"
						+ "<li>name= " + id + "</li>"
						+ "<li>name= " + name + "</li>"
						+ "<li>surname= " + surname + "</li>"
						+ "<li>username= " + username + "</li>"
						+ "<li>password= " + password + "</li>"
						+ "<li>ssn= " + ssn + "</li>"
						+ "<li>email= " + email + "</li>"
						+ "</ul>";
	}

}