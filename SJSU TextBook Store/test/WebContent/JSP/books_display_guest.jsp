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
		<a href="./initial_homepage.jsp">Home</a> <a
			href="./books_display_guest.jsp">Books</a>
		<div class="search-container">
			<form action="books_display.jsp" autocomplete="off">
				<input type="text" placeholder="Search by Title or Author"
					name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>

		<div class="account">
			<a href="./login.jsp">Log In</a>
		</div>

	</div>
</div>


<body>
	<section>
		<!-- DISPLAY COLLECTION OF BOOKS -->
		<h1>Books</h1>

		<!-- Create table that returns information on the book through a table -->
		<table class="table-desgin">
			<tr>
				<th>Title</th>
				<th>Book Description</th>
				<th>Author</th>
				<th>Price</th>
			</tr>
			<%
				String userInput = request.getParameter("search");
			String db = "sjsu_textbookstore";
			String user; // assumes database name is the same as username
			user = "root";
			String password = "N00bcakes";
			try {
				java.sql.Connection con;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?serverTimezone=EST5EDT", user,
				password);
				//out.println(db + " database successfully opened.<br/><br/>");
				int count = 0;
				//Create sql statement
				Statement stmt = con.createStatement();
				//Query will always be null when user visits page from different link
				ResultSet rs = stmt
				.executeQuery("SELECT * FROM book WHERE title = '" + userInput + "' OR author = '" + userInput + "'");
				if (userInput != null) {
					boolean empty = rs.next();
					//If no results are found then display message and all the books
					if (empty == false) {
				out.println("<b>No results from your search were found <br> Try checking our list of books</b> <br>");
				rs = stmt.executeQuery("SELECT * FROM book");
				while (rs.next()) {
					out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" + rs.getString("description")
							+ "</td><td>" + rs.getString("author") + "</td><td> $" + rs.getString("price") + "</td></tr>");
				}
					}
					rs.close();
					stmt.close();
					con.close();
				}
				//Displays all the books when user arrives at page each time
				else {
					rs = stmt.executeQuery("SELECT * FROM book");
					int incrementer = 0;
					while (rs.next()) {
				out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" + rs.getString("description") + "</td><td>"
						+ rs.getString("author") + "</td><td> $" + rs.getString("price") + "</td></tr>");
				incrementer++;
					}
				}
			} catch (SQLException e) {
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