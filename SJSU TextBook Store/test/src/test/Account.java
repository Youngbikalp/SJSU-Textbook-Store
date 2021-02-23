package test;

import java.util.ArrayList;

public class Account {
	private String Account_id;
	private String password;
	private String username;
	private String firstName;
	private String LastName;
	private String sjsuID;

	public String getAccount_id() {
		return Account_id;
	}

	public void setAccount_id(String account_id) {
		Account_id = account_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastname(String lastName) {
		LastName = lastName;
	}

	public String getSjsuID() {
		return sjsuID;
	}

	public void setSjsuID(String sjsuID) {
		this.sjsuID = sjsuID;
	}

}