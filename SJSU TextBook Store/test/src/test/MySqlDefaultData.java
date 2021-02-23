package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;

public class MySqlDefaultData {
	
	static ArrayList<Book> b= new ArrayList<Book>();
	static ArrayList<Member> m = new ArrayList<Member>();
	static ArrayList<Admin> a = new ArrayList<Admin>();
	
	
	public static void main(String[] args) throws Exception {
		// Connection to MySql
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SJSU_TextBookStore?serverTimezone=UTC", "root", "rootpass");
		
		//Collection of Books
		ArrayList<Book> books =b;
		
		books.add(new Book("Calculus:Early Transcendtentals 8th Edition","Use for Math 30, Math 31, Math 32","James Stewart", 75,"1285741552"));
		books.add(new Book("University Physics with Modern Physics 14th Edition","Use for Physics 50 & 51","Roger A. Freedman", 55,"080532187X"));
		books.add(new Book("Psychology 9th Edition","New","David G. Myers", 70,"1429215976"));
		books.add(new Book("Cracking the Coding Interview","","Gayle Laakmann McDowell", 35,"0984782850"));
		books.add(new Book("Introduction to Algorithms 3rd Edition","Use for CS 146","", 120,"9780262033848"));
		books.add(new Book("Public Speaking: Concepts and Skills for a Diverse Society 8th Edition","","Clella Jaffe", 45,""));
		books.add(new Book("Big Java: Early Objects 6th Edition","Still in Good Condition","Cay S. Horstmann", 66,"1119056446"));
		books.add(new Book("Mental Health","Understand why it is important to take care of yourself","", 5,""));
		books.add(new Book("Book of Life","","", 500,""));
		books.add(new Book("MySQL","Use for CS157A","James Stewart", 15," "));
		books.add(new Book("Object Oriented Programming","Use for CS151","George Stewart", 88," "));
	
		
		//Collection of Members
		ArrayList<Member> mem= m;
		mem.add(new Member(0111111, "Billy", "frank","billy1", "password", "123124" ));
		mem.add(new Member(1234678,"Sarah","Dill", "sarah.d", "Passwr0d","2231%24" ));
		mem.add(new Member(0132111,"Jose", "Torrez","JoseIII", "12rat0909","101%24" ));
		mem.add(new Member(9212111,"Yang", "Hong","yanghong", "password","9931%0" ));
		mem.add(new Member(4115716,"Jennie","Yin","jennie", "2020Covid","671%24" ));
		mem.add(new Member(0100411,"Billy","Mart","billy2", "p@ssword" ,"1231088"));
		mem.add(new Member(5595111,"Rachel","Ruz","rachel1", "pa55word","8831%24" ));
		mem.add(new Member(4118910,"Alex","Henny","AlexanderTheGreat", "ImDeadXX","181%24"));
		mem.add(new Member(0111143,"Felix","Cross","felixx", "SJSU2000" ,"1211124"));
		mem.add(new Member(0314101,"Kelly","Rose","kelly99", "23yolo!","1245%24" ));
		mem.add(new Member(128271,"Winnie", "Smith","winnie9", "2hanolo!","1901%24" ));
		
		//Collection of Admin
		ArrayList<Admin> ad=a;
		ad.add(new Admin("admin1","SJSUadmin0","12312412"));
		ad.add(new Admin("admin2","SJSUadmin0", "90249232"));
		
		// date
		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		java.sql.Timestamp timestamp = new java.sql.Timestamp(now.getTime());
		
		
		Statement statement = connection.createStatement();

		//INSERT ADMIN
		for(Admin a: ad) {
			String insertAdminSql = "INSERT INTO admin(username, password, salt1) "          
					+ "VALUES ('"+a.getUsername()+"', '" + a.getPassword()+"', '" + a.getSalt()+"')";
			statement.execute(insertAdminSql);
		}	
		//INSERT BOOK
		for(Book a: books) {
	
			String insertBookSql = "INSERT INTO book( title, description, date, author, isbn, price) "          
					+ "VALUES ('"+a.getTitle()+"', '" + a.getDescription()+"', '" +sqlDate+"', '" +a.getAuthor()+"', '" +a.getIsbn()+"', '" +a.getPrice()+"')";
			statement.execute(insertBookSql);
		}	

		//INSERT MEMBER	
		for(Member a: mem) {
			String insertMemSql = "INSERT INTO member(sjsu_id, first_name, last_name,user_name, password, salt1) "          
					+ "VALUES ('"+a.getSjsuID()+"', '"  + a.getFirstName()+"', '"  + a.getLastName()+"', '"  + a.getUsername()+"', '" + a.getPassword()+"', '" + a.getSalt()+"')";
			statement.execute(insertMemSql);
		}
	

		//INSERT ADMIN_BOOKS
		for(int i=0; i<10;i++) {
			String val="";
			if(i%2!=0) {
			 val= "VALUES ('"+1+"')";
			
			}else {
				val= "VALUES ('"+2+"')";
			}
			
			String insertAdBKSql = "INSERT INTO admin_books(admin_id) "          
					+ val;
			statement.execute(insertAdBKSql);
		}
		
		//INSERT ADMIN_MEMBER
		
		
		for(int i=0; i< mem.size();i++) {
			String val="";
			if(i%2 ==0) {
			 val= "VALUES ('"+1+"')";
			}else {
				val= "VALUES ('"+2+"')";
			}
			String insertAdMemSql = "INSERT INTO admin_members(admin_id) "          
					+ val;
			statement.execute(insertAdMemSql);
		}

		
		//INSERT MEMBER_BUY
		for(int i=0; i<mem.size();i++) {
			int num= i+1;
			String valMemBuy= "VALUES ('"+num+"', '"+num+"')";
			String insertMemBuySql = "INSERT INTO member_buy(account_id,book_id) "          
					+ valMemBuy;
			statement.execute(insertMemBuySql);
			
		}
					
		//INSERT MEMBER_Sells
		for(int i=0; i<10;i++) {
			int num=i+1;
			String valMemBuy="";
			if(num%2!=0 && num<4) {
				valMemBuy= "VALUES ('"+(i+4)+"', '"+(i+4)+"')";
			}else {
				valMemBuy= "VALUES ('"+(i)+"', '"+(i)+"')";
			}

			String insertMemSql = "INSERT INTO member_sell(account_id,book_id) "          
					+ valMemBuy;
			statement.execute(insertMemSql);
		}
	

		//INSERT PURCHASE
		for(int i=0; i<mem.size();i++) {
		int num=i+1;
			String valMemBuy="";
			if(num%2!=0 && num<6) {
				valMemBuy= "VALUES ('"+(i+1)+"', '"+(10-i)+"', '"+books.get(10-i).getPrice()+"')";

			}else {
				valMemBuy= "VALUES ('"+(i)+"', '"+(i)+"', '"+books.get(10-i).getPrice()+"')";
			}

			String insertMemSql = "INSERT INTO purchase( account_id,book_id, price) "          
					+ valMemBuy;
			statement.execute(insertMemSql);
		}

		//INSERT SHARE
		for(int i=0; i<mem.size();i++) {
			int num= i+1;
			String valMemBuy="";
			if(num%2!=0 && num<5) {
				valMemBuy= "VALUES ('"+(num+4)+"', '"+(10-num)+"', '"+(num+3)+"')";

			}else {
				valMemBuy= "VALUES ('"+num+"', '"+(11-num)+"', '"+(15-num)+"')";
			}

			String insertMemSql = "INSERT INTO member_share (sender_id, book_id, receiver_id) "          
					+ valMemBuy;
			statement.execute(insertMemSql);
		}
				
		//INSERT RECENTLY SEARCH
		for(int i=0; i<mem.size();i++) {
			int num = i+1;
			String valMemBuy="";
			if(num%2!=0 && num<5) {
				valMemBuy= "VALUES ('"+(10-i)+"', '"+(i+3)+"', '"+timestamp+"')";

			}else {
				valMemBuy= "VALUES ('"+(i)+"', '"+(i)+"', '"+timestamp+"')";
			}

			String insertMemSql = "INSERT INTO recently_search(book_id, account_id ,timestamp) "          
					+ valMemBuy;
			statement.execute(insertMemSql);
		}

		
		// Close connection
		statement.close();
		connection.close();

	}

}
