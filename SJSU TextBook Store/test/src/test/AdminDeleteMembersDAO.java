package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDeleteMembersDAO {
	
	
	public int deleteMember(Account deleteMember) throws Exception {
		/*
		 * Delets users from account by account_id
		 */
		String insert = "DELETE from account where account_id = ?";
		int result = 0;
		
		try (
				//Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root", "N00bcakes");
				
				
				PreparedStatement preparedStatement = connection.prepareStatement(insert)){
				preparedStatement.setString(1, deleteMember.getAccount_id());
				
				System.out.println(preparedStatement);
				
				result = preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return 0;
		
	}
}
