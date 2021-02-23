<%@ page import="java.sql.*"%>
<html>

<!-- Links to css page -->
<head>
	<title>Home</title>
	<link rel="stylesheet" href=../css/design.css>
</head>

<!-- Header with navigation bar -->

<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./admin_homepage.jsp">Home</a> <a href="./AdminAddBooks.jsp">Manage
			Books</a> <a href="./AdminManageMembers.jsp">Manage Members</a>

		<div class="account">
			<a href="./initial_homepage.jsp">Log Out</a>
		</div>
	</div>
</div>


<body>
		<section>
		<!-- Selects all the books that are managed by this specific admin -->
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
	
		
		<!-- Table that displays the member name, title of book, and request id from member that requested this book to be placed
		in the database -->
		<table class="table-desgin-two">
			<tr>
				<th>Request ID</th>
				<th>Member Name</th>
				<th>Title of Book</th>
				
			</tr>
			
			<% //Retrieves Request ID, user name, and title from request books table
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String admin_id=(String)request.getSession().getAttribute("adminid");
		String query = "select request_books.request_id,account.user_name, request_books.title from account,request_books where account.account_id = request_books.account_id;";
		
		PreparedStatement prepared = connection.prepareStatement(query);  
    	//prepared.setString(1, admin_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while (rs.next()) {
            out.println("<tr> <td>" + rs.getString("request_id") + "</td> <td>" +
            rs.getString("user_name") + "</td><td>" + rs.getString("title") + "</td><td></tr>");
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