<%@ page import="java.sql.*"%>
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
		<a href="./admin_homepage.jsp">Home</a> <a href="./AdminAddBooks.jsp">Manage
			Books</a> <a href="./AdminManageMembers.jsp">Manage Members</a> <a
			href="./AdminViewBooks.jsp">View Books</a>
		<div class="search-container">
			<form action="AdminViewBooks.jsp" autocomplete = "off">
				<input type="text" placeholder="Search..." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>
				
		<div class="account">
			<a href="./initial_homepage.jsp">Log Out</a>
		</div>

	</div>
</div>


<body>
	<section>
	
	
	<% //to print the first and last name
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String admin_id=(String)request.getSession().getAttribute("adminid");
		String query = "SELECT user_name from admin where admin_id = ?";
		
		PreparedStatement prepared = connection.prepareStatement(query);  
    	prepared.setString(1, admin_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while(rs.next()){
		out.println("<h1>Books managed by " + rs.getString("user_name") + "</h1>");
		}
	} catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
	%>
	
		
		
		<table class="table-desgin-two">
			<tr>
				<th>Book ID</th>
				<th>Title</th>
				<th>Description</th>
				<th>Author</th>
				
			</tr>
			
			<% 
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String admin_id=(String)request.getSession().getAttribute("adminid");
		String query = "SELECT * from book,admin_books where admin_id = ? AND admin_books.book_id = book.book_id";
		
		PreparedStatement prepared = connection.prepareStatement(query);  
    	prepared.setString(1, admin_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while (rs.next()) {
            out.println("<tr> <td>" + rs.getString("book_id") + "</td> <td>" +
            rs.getString("title") + "</td><td>" + rs.getString("description") + "</td><td>" + rs.getString("author") +"</td></tr>");
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