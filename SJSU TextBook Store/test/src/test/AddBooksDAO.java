package test;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddBooksDAO {
	public int addBook(Book addBook) throws Exception {

		/*
		 * This is to add the books which the admin enters into the form, the query is
		 * for inserting books at the book table.
		 */

		String insert = "INSERT into book" + "(title,description,date,author,isbn,price) VALUES " + " (?,?,?,?,?,?)";
		int result = 0;

		try (
				// Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
						"N00bcakes");

				PreparedStatement preparedStatement = connection.prepareStatement(insert)) {
			preparedStatement.setString(1, addBook.getTitle());
//				preparedStatement.setInt(2, acc.getAccount_id());
			preparedStatement.setString(2, addBook.getDescription());
			preparedStatement.setDate(3, getCurrentDate());
			preparedStatement.setString(4, addBook.getAuthor());
			preparedStatement.setString(5, addBook.getIsbn());
			preparedStatement.setString(6, addBook.getPrice());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}

	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
}
