package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class AccountDAO {
//	static PreparedStatement preparedStatement;
	public int register(Account acc) throws Exception {
		Random random = new Random();
		String salt1 = Integer.toString(random.nextInt(1000000000 - 1 + 1) + 1);// generates random number when a new
																				// user signups
		/*
		 * Inserts the information which the users inputs into the form, the SHA2 is a
		 * hash and CONCAT will concatenate the salt and the password creating the SHA2
		 * hashed password.
		 */
		String insert = "INSERT into account" + "(sjsu_id,first_name,last_name,user_name,salt1,password) VALUES "
				+ " (?,?,?,?,?,SHA2(CONCAT(?,?),256));";
		int result = 0;

		try (
				// Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
						"N00bcakes");

				PreparedStatement preparedStatement = connection.prepareStatement(insert)) {
			preparedStatement.setString(1, acc.getSjsuID());
			preparedStatement.setString(2, acc.getFirstName());
			preparedStatement.setString(3, acc.getLastName());
			preparedStatement.setString(4, acc.getUsername());
			preparedStatement.setString(5, salt1);
			preparedStatement.setString(6, acc.getPassword());
			preparedStatement.setString(7, salt1);

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}
}