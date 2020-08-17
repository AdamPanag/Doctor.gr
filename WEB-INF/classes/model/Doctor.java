package model;

public class Doctor extends User {

//    int id;
//    String name;
//    String surname;
//    String username;
//    String password;
//    String email;
    String specialty;
    String area;
    String address;
    String phoneNumber;

    public Doctor(int id, String name, String surname, String username, String password, String email,
    		String specialty, String area, String address, String phoneNumber) {
        super(id, name, surname, username, password, email);
        this.specialty = specialty;
        this.area = area;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }
    
    public Doctor() {}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
							+ "<li>specialty= " + specialty + "</li>"
							+ "<li>phoneNumber= " + phoneNumber + "</li>"
							+ "<li>email= " + email + "</li>"
							+ "<li>address= " + address + "</li>"
							+ "<li>area= " + area + "</li>"
							+ "</ul>";
	}

}