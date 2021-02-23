<%@ page import="java.sql.*, java.util.Date, java.io.*"%>

<html>
<!-- Links to css page -->
<head>
	<title>Book</title>
	<link rel="stylesheet" href=../css/design.css>
</head>

<!-- Navigation and search bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./member_homepage.jsp">Home</a> <a href="./books_display.jsp">Books</a>
		<a href="./share_book.jsp">Share Books</a> 
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
			 <a href="./checkout.jsp">CheckOut</a>
			 <a href="./acoount.jsp">Account</a>
			<a href="./initial_homepage.jsp">Log Out</a>
		</div>

	</div>
</div>



<body>
	<section>
		<h1>Request Books</h1>
		<!-- Request books form for user -->
		<form  action = "./request_books.jsp" method = "POST" class="input-group-1" > 
			<input class = "input-field-1" type= "text" placeholder="Title" name= "title" />
		</form>

		<% //Enters the book that user requested into request books table	
		String title = request.getParameter("title");
	     String users; 
	     users = "root";
	     String passwords = "N00bcakes";
	
	     try {      
	         	java.sql.Connection con; 
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false",users, passwords);
		        if(title != null)
		        {
		        	String account_id=(String)request.getSession().getAttribute("userid");	        	
			        String query = "INSERT into request_books (account_id, title) values (?,?)";		        
					PreparedStatement prepared = con.prepareStatement(query);
					prepared.setString(1, account_id);
					prepared.setString(2, title);					
					prepared.executeUpdate();
			        //Close connection 	
		            con.close();		            
	        	}		        
	     } catch(SQLException e) { 
	            out.println("SQLException caught: " + e.getMessage()); 
	        }        	
	    	
		%>
	</section>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	 <a href="./about.jsp">About</a>
</footer>
</html>