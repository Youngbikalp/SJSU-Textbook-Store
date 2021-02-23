<%@ page import="java.sql.*"%>
<html>
<!-- Links to css page -->
<head>
	<title>Home</title>
	<link rel="stylesheet" href=../css/design.css>
</head>

<!-- Navigation bar and Search bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./member_homepage.jsp">Home</a> 
		<a href="./books_display.jsp">Books</a>
		<a href="./share_book.jsp">Share Books</a> 
		<a href="./request_books.jsp">Request Books</a>

		<div class="search-container">
			<form action="books_display.jsp" method = "post">
				<input type="text" placeholder="Search by Title or Author" name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>
		<div class="account">
			<a href="./checkout.jsp">Check Out</a>
			<a href="./account.jsp">Account</a> 
			<form action="<%=request.getContextPath()%>/logout" method="post">
				<button type="submit" name="Logout" value="Logout">Logout</button>
			</form>	
		</div>

	</div>
</div>


<body>
	<section>
	<!-- Table with recently searched books -->
		<h1>Welcome Back to Student Bookstore!</h1>
		<img src="../img/157A_d.png" width="250" height="250">
		<h2>Recently Search Books</h2>
		<table class="table-desgin">
			<tr>
				<th>Title</th>
				<th>Book Description</th>
				<th>Author</th>
				<th>Price</th>
			</tr>
			<% 
		     String db = "sjsu_textbookstore";
		     String user; 
		     user = "root";
		     String password = "N00bcakes";
		     
		     try {       
         	java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false",user, password);
	        String query = ("SELECT * FROM recent_search,book WHERE account_id = ? AND recent_search.book_id = book.book_id order by search_id desc limit 5");	
	        String account_id=(String)request.getSession().getAttribute("userid");
	   		PreparedStatement prepared = con.prepareStatement(query);  
	        prepared.setString(1, account_id);
	    	ResultSet rs = prepared.executeQuery();
	    	rs = prepared.executeQuery();
	        while (rs.next()) {
		            out.println("<tr> <td>" + rs.getString("title") + "</td> <td>" +
		            rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td>$" + rs.getString("price") +"</td></tr>");
		    }
	        //Close connections        
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