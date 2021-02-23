package test;

public class Admin {
	private int adminID;
	private String username;
	private String password;
	private String salt;

	Admin(String username, String pass, String salt) {

		this.username = username;
		this.password = pass;
		this.salt = salt;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public int getAdmintID() {
		return adminID;
	}

	public String getSalt() {
		return salt;
	}

}