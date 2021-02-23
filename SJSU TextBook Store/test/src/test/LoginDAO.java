package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	public Account login(String username, String password) throws SQLException {
		Account status = null;
		/*
		 * It selects username and password form the database
		 */
		String query = "SELECT * FROM account WHERE user_name = ? and password = ?";
		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root", "N00bcakes");
		PreparedStatement preparedstatement = connection.prepareStatement(query);
		preparedstatement.setString(1, username);
		preparedstatement.setString(2, password);

		ResultSet result = preparedstatement.executeQuery();

		connection.close();

		return status;

	}

}