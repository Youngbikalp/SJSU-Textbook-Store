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
			<a href="./initial_homepage.jsp" >Log Out</a>
		</div>

	</div>
</div>


<body>
	<section>
		<!-- Welcome page for user -->
		<% 
		//Database retrieves the username 
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String account_id=(String)request.getSession().getAttribute("userid");
		String query = "SELECT first_name, last_name from account where account_id = ?";
		
		PreparedStatement prepared = connection.prepareStatement(query);  
    	prepared.setString(1, account_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while(rs.next()){
		out.println("<h1>Welcome " + rs.getString("first_name") + " " + rs.getString("last_name") + "</h1>");
		}
	} catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
	%>

		<!-- Display information retrieved from database into a table-->
		<table class="table-desgin-two">
			<tr>
				<th>SJSU ID</th>
				<th>Username</th>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>
			<% 
			//Retrieves information from database into table 
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String account_id=(String)request.getSession().getAttribute("userid");
		String query = "SELECT sjsu_id, user_name, first_name, last_name from account where account_id = ?";
		
		PreparedStatement prepared = connection.prepareStatement(query);  
    	prepared.setString(1, account_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while (rs.next()) {
            out.println("<tr> <td>" + rs.getString("sjsu_id") + "</td> <td>" +
            rs.getString("user_name") + "</td><td>" + rs.getString("first_name") + "</td><td>" + rs.getString("last_name") +"</td></tr>");
      }
	} catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
	%>
		</table>
		
		<!-- Recent transaction table display with information retrieved from database  -->
		<h2>Recent Transaction History</h2>
		<table class="table-desgin-two">
			<tr>
				<th>Transaction ID</th>
				<th>Title</th>
				<th>Price</th>
			</tr>
			<% 		
     String db = "sjsu_textbookstore";
     String user; 
     user = "root";
     String password = "N00bcakes";
     
try {       
    	 /**
    	 Establish connection with the database and selects all the transactions made by a user.
    	 Table shows title, transaction id, and price
    	 **/
         	java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false",user, password);
	        String query = ("SELECT DISTINCT purchase.transaction_id, book.title, book.price FROM purchase,book WHERE account_id = ? AND purchase.book_id = book.book_id");	
	        String account_id=(String)request.getSession().getAttribute("userid");
	   		PreparedStatement prepared = con.prepareStatement(query);  
	        prepared.setString(1, account_id);
	    	ResultSet rs = prepared.executeQuery();
	    	rs = prepared.executeQuery();
	        while (rs.next()) {
		    	out.println("<tr> <td>" + rs.getString("transaction_id") + "</td> <td>" +
		        rs.getString("Title") + "</td><td>" + rs.getString("Price") + "</td></tr>");
	        }       
	        rs.close();
	        con.close();
         	
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