package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;


public class MySqlTables {
	public static void main(String[] args) throws Exception {
		// Connection to MySql
		//CHANGE TO MATCH CONNECTION ON MY SQL
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SJSU_TextBookStore?serverTimezone=UTC", "root", "rootpass");

		// Create member table
		String member = "CREATE TABLE member(account_id INT NOT NULL AUTO_INCREMENT, " 
				+ "sjsu_id INT NULL, first_name VARCHAR(250) NOT NULL, last_name VARCHAR(250) NOT NULL,  user_name VARCHAR(250) NOT NULL UNIQUE, password VARCHAR(250) NOT NULL, salt1 VARCHAR(250) NOT NULL,"+ "PRIMARY KEY (account_id ))";

		// Create book table
		String book = "CREATE TABLE book(book_id INT NOT NULL AUTO_INCREMENT, " 
				+ "title VARCHAR(100) NULL, description VARCHAR(60) NULL, date DATETIME NOT NULL," 
				+ "author VARCHAR(250) NULL, isbn VARCHAR(250) NULL, price INT NOT NULL,"+ "PRIMARY KEY (book_id ))";

		// Create member buys table
		String buys = "CREATE TABLE member_buy(receipt_id INT NOT NULL AUTO_INCREMENT, " 
				+ "account_id INT NOT NULL , book_id INT NULL,  "+ "PRIMARY KEY (receipt_id ))";

		// Create member sells table
		String sells = "CREATE TABLE member_sell(receipt_id INT NOT NULL AUTO_INCREMENT , "  
				+ "account_id INT NOT NULL , book_id INT NULL, "+ "PRIMARY KEY (receipt_id ))";

		// Create member shares table
		String recentlySearch = "CREATE TABLE recently_search(search_id INT NOT NULL AUTO_INCREMENT, " + " book_id INT NULL, "
				+ "account_id INT NOT NUll, timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"+ "PRIMARY KEY (search_id ))";		

		// Create member recently search table
		String shares= "CREATE TABLE member_share(share_id INT NOT NULL AUTO_INCREMENT , "  + " sender_id INT NOT NULL, book_id INT NULL, "
				+ "receiver_id INT NOT NUll, "+ "PRIMARY KEY (share_id ))";


		// Create admin table
		String admin = "CREATE TABLE admin(admin_id INT NOT NULL AUTO_INCREMENT, " 
				+ "username VARCHAR(250) NULL, password VARCHAR(250) NULL, salt1 VARCHAR(250) NOT NULL,"+ "PRIMARY KEY (admin_id ))";

		// Create admin manages books table
		String admin_books = "CREATE TABLE admin_books(admin_id INT NOT NULL, " 
				+ "book_id INT NOT NUll AUTO_INCREMENT, "+ "PRIMARY KEY (book_id ))";

		// Create admin manges member table
		String admin_members = "CREATE TABLE admin_members (admin_id INT NOT NULL , " 
				+ "account_id INT NOT NUll AUTO_INCREMENT, "+ "PRIMARY KEY (account_id ))";

		// Create purchase table
		String purchase = "CREATE TABLE purchase (transaction_id INT NOT NULL AUTO_INCREMENT, " 
				+ "account_id INT NOT NUll, book_id INT NOT NUll, price INT NOT NULL,"+ "PRIMARY KEY (transaction_id ))";



		//Stores the collection my sql
		ArrayList<String> tables = new ArrayList<String>();
		tables.add(member);
		tables.add(book);
		tables.add(buys);
		tables.add(sells);
		tables.add(shares);
		tables.add(recentlySearch);
		tables.add(admin);
		tables.add(admin_members);
		tables.add(admin_books);
		tables.add(purchase);
		

		Statement statement = connection.createStatement();
		
		for(String s : tables) {
			statement.execute(s);
		}
		
		
		statement.close();

		// Close connection
		connection.close();
	}
}