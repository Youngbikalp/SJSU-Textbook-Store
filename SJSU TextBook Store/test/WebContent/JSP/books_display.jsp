<%@ page import="java.sql.*, java.util.Date, java.io.*"%>

<html>
<!-- Links to css page -->
<head>
	<title>Book</title>
	<link rel="stylesheet" href=../css/design.css>

</head>

<!-- Header with navigation bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./member_homepage.jsp">Home</a> <a href="./books_display.jsp">Books</a><a href="./share_book.jsp">Share Books</a> <a
			href="./request_books.jsp">Request Books</a>
		<div class="search-container">
			<form action="books_display.jsp" autocomplete = "off">
				<input type="text" placeholder="Search by Title or Author" name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>
				
		<div class="account">
			<a href="./checkout.jsp">Check Out</a>
			<a href="./account.jsp" >Account</a> 
			<a href="./initial_homepage.jsp" >Log Out</a>
		</div>

	</div>
</div>


<body>
	<section>
		<!-- DISPLAY COLLECTION OF BOOKS -->
		<h1>Books</h1>
		<!-- Adds books to checkout cart -->
		<form action = "./books_display.jsp" method = "POST">Enter the Book You Wish to Add to Cart: 
			<input type= "text" name= "booksToAdd"/>
		</form>
		<%
		String addingBooks = request.getParameter("booksToAdd");
		String id = "123";
		String database = "sjsu_textbookstore";
	     String users; // assumes database name is the same as username
	     users = "root";
	     String passwords = "root";
	
	     try {      
	         	java.sql.Connection con; 
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?serverTimezone=EST5EDT",users, passwords);
				//Create sql statement
		        Statement stmt = con.createStatement();
		        //int rand3 = (int)Math.floor(Math.random() * 10000) + 1;
		        if(addingBooks != null)
		        {
		        	
			        ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE title = '"+addingBooks+"'");
			        boolean empty = rs.next(); 
		            //If no results are found then display message 
		            if(empty == false)
		            {
		            	out.println("<b>Please enter a valid book</b><br>");	
		            }
		            //Display the results from the query given by the user, the book is stored in the database for recently searched
		            else
		            {
		            	//out.println(rs.getString("book_id"));
		            	String query = "INSERT INTO checkout(book_id, account_id, title) VALUES ('"+rs.getString("book_id")+"', '"+id+"', '"+rs.getString("title")+"')";	
		            	PreparedStatement prepared = con.prepareStatement(query);
		            	prepared.execute();
		            }	            
		            rs.close();
		            stmt.close();
		            con.close();
		            
	        	}
		        
		        
	     } catch(SQLException e) { 
	            out.println("SQLException caught: " + e.getMessage()); 
	        }        	
	    	
		%>
		<!-- Create table that returns information on the book through a table -->
		<table class = "center" border = "5" cellpadding = "15" cellspacing = "10" width = 100%>
			<tr>
				<th>Title</th>
				<th>Book Description</th>
				<th>Author</th>
				<th>Price </th>
			</tr>
			<% 
			
  	 String userInput = request.getParameter("search");
     String db = "sjsu_textbookstore";
     String user; // assumes database name is the same as username
     user = "root";
     String password = "root";
     try {       
         	java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?serverTimezone=EST5EDT",user, password);
            //out.println(db + " database successfully opened.<br/><br/>");
            int count = 0;
			//Create sql statement
	        Statement stmt = con.createStatement();
	        Date date = new Date(); 
	        Timestamp ts = new Timestamp(date.getTime());
	        int rand = (int)Math.floor(Math.random() * 10000) + 1;
	        int rand2 = (int)Math.floor(Math.random() * 10000) + 1;
        	int ids = 123;
	        //Query will always be null when user visits page from different link
	        ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE title = '" + userInput + "' OR author = '" + userInput + "'");
	        if(userInput != null)
	        {
	            boolean empty = rs.next(); 
	            //If no results are found then display message and all the books
	            if(empty == false)
	            {
	            	out.println("<b>No results from your search were found <br> Try checking our list of books</b> <br>");	
	            	rs = stmt.executeQuery("SELECT * FROM book");
	            	while (rs.next()) {
		                out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
		                rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td> $"    + rs.getString("price") + "</td></tr>");
		            }
	            }
	            //Display the results from the query given by the user, the book is stored in the database for recently searched
	            else
	            {
	            	String query = "INSERT INTO recently_search (search_id, book_id,account_id, timestamp) VALUES ('"+rand+"' ,'"+rs.getInt("book_id")+"', '"+ids+"' , '"+ts+"')";
	            	PreparedStatement prepared = con.prepareStatement(query);
	            	prepared.execute();
	            	rs = stmt.executeQuery("SELECT * FROM book WHERE title = '" + userInput + "' OR author = '" + userInput + "' ");
		            while (rs.next()) {
		                out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
		                rs.getString("description") + "</td><td>" + rs.getString("author") 
		                + "</td><td> $" + rs.getString("price") +"</td></tr>");
		            }
	            }	            
	            rs.close();
	            stmt.close();
	            con.close();
         	}
	        //Displays all the books when user arrives at page each time
            else
            {
            	rs = stmt.executeQuery("SELECT * FROM book");
            	int incrementer = 0;
            	while (rs.next()) {
	                out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
	                rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td> $" + rs.getString("price") 
	                +"</td></tr>");
	            	incrementer++;
            	}
            }
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }        	
    	%>
    	</table>
	</section>
</body>

<!-- Footer of page that contains link to about page -->
<footer>
	 <a href="./about.jsp">About</a>
</footer>
</html>