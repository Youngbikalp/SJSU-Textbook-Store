package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginDAO {
	public Admin checklogin(String username, String password) throws SQLException {
		Admin status = null;
		
		/*
		 * This slects the username and password from the admin table
		 */
		String query = "SELECT * FROM admin WHERE user_name = ? and password = ?";
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root", "N00bcakes");
		PreparedStatement preparedstatement = connection.prepareStatement(query);
		preparedstatement.setString(1,username);
		preparedstatement.setString(2,password);
		
		ResultSet result = preparedstatement.executeQuery();
		
		connection.close();
		
		return status;

}
}
