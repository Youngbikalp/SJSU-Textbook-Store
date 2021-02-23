<%@ page import="java.sql.*, java.util.Date, java.io.*"%>

<html>
<!-- Links to css page -->
<head>
	<title>Book</title>
	<link rel="stylesheet" href=../css/design.css>

</head>

<!-- Header that contains navigation bar and seach bar-->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./admin_homepage.jsp">Home</a> <a href="./AdminAddBooks.jsp">Manage
			Books</a> <a href="./AdminManageMembers.jsp">Manage Members</a> <a
			href="./AdminViewBooks.jsp">View Books</a>

			<form action="AdminViewBooks.jsp" autocomplete="off">
				<input type="text" placeholder="Search by Title or Author"
					name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>

		<div class="account">
			<a href="./initial_homepage.jsp">Log Out</a>
		</div>

</div>


<body>
	<section>
		<!-- This is the admin view for books.  This code retrieves data from book table in database
		and displays the title, book description, author, and price for all the books -->
		<h1>Books</h1>	
		<table class = "table-desgin">
			<tr>
				<th>Title</th>
				<th>Book Description</th>
				<th>Author</th>
				<th>Price </th>
			</tr>
			
			<% //Selects the books from book table in database an displays the search results based on user preference
			
	 //Gets user input from search bar
  	 String userInput = request.getParameter("search");
     String db = "sjsu_textbookstore";
     String user; 
     user = "root";
     String password = "N00bcakes";
     try {       
         	java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false",user, password);
	        Statement stmt = con.createStatement();
	        //This search always returns null when the page loads 
	        ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE title = '" + userInput + "' OR author = '" + userInput + "'");
	        if(userInput != null)
	        {
	            boolean empty = rs.next();     
	            //If book does not exist in databse, then request the user to find a new book
	            if(empty == false)
	            {
	            	out.println("<b>No results from your search were found <br> Try checking our list of books</b> <br>");	
	            	rs = stmt.executeQuery("SELECT * FROM book");
	            	while (rs.next()) {
		                out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
		                rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td> $" + rs.getString("price") +"</td></tr>");
		            }
	            }
	            //If search is valid, then database retries database of all the books that match the user input
	            else
	            {    
	            	rs = stmt.executeQuery("SELECT * FROM book WHERE title = '" + userInput + "' OR author = '" + userInput + "'"); 
		            while (rs.next()) {
		                out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
		                rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td> $" + rs.getString("price") +"</td></tr>");
		            }
	            }	      
	            //Close connections
	            rs.close();
	            stmt.close();
	            con.close();
         	}
	        //Displays all the books if user does not enter into the search bar
            else
            {
            	rs = stmt.executeQuery("SELECT * FROM book");
            	while (rs.next()) {
	                out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
	                rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td> $" + rs.getString("price") +"</td></tr>");
	            }
            }
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
         	
   		 %>
    	</table>
	</section>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	 <a href="./about.jsp">About</a>
</footer>
</html>