<%@ page import="java.sql.*"%>
<html>
<!-- Links to css page -->
<head>
	<title>Home</title>
	<link rel="stylesheet" href=../css/design.css>
</head>

<!-- Navigation bar and search bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./member_homepage.jsp">Home</a> <a href="./books_display.jsp">Books</a> 
		<a href="./request_books.jsp">Request Books</a>

		<div class="search-container">
			<form action="books_display.jsp" method="post">
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
	<h1>Share Page</h1>
		<!-- Form where users can enter the book that they want to share with another user -->
		<form  action = "./share_book.jsp" method = "POST" class="input-group-1" > 
			<input class = "input-field-1" type= "text" placeholder="Enter the Book You Wish to Share" name= "booksShare" />	
			<br><br>
			<input class = "input-field-1" type= "text" placeholder="Enter User" name= "usersShare" />
			<br>
			<br>
			<input type = "submit" >
		</form>
				
			<% //Takes in the input that was entered by the user with book share and user share
	try{
		String booksShare = request.getParameter("booksShare");
		String usersShare  = request.getParameter("usersShare");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		Statement stmt = connection.createStatement();
		Statement stmt1 = connection.createStatement();
		if(booksShare != null && usersShare != null)
        {
        	
	        ResultSet rs1 = stmt.executeQuery("SELECT book_id FROM book WHERE title = '"+booksShare+"'");
	        ResultSet rs2 = stmt1.executeQuery("SELECT account_id FROM account WHERE user_name = '"+usersShare+"'");
	        rs1.next();
	        rs2.next();
           	String accounts_id=(String)request.getSession().getAttribute("userid");
            int accountss_id = Integer.parseInt(accounts_id);
            String query = "INSERT INTO member_share(sender_id, book_id, receiver_id) VALUES ('"+accountss_id+"', '"+rs1.getInt("book_id")+"', '"+rs2.getInt("account_id")+"')";	
            PreparedStatement prepared = connection.prepareStatement(query);
            prepared.execute();
         }	   
           
	} catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
		%>
		
		<!-- Displays all the books shared to this user in a table-->
		<h2>Books Shared With You</h2>
		<table class="table-desgin-two">
			<tr>
				<th>User ID</th>
				<th>book name</th>
				<th>Description</th>
			</tr>
			<% 
     String db = "sjsu_textbookstore";
     String user; 
     user = "root";
     String password = "N00bcakes";
     try {       
    		String account_num=(String)request.getSession().getAttribute("userid");
         	java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement();
        	//Retrive data from book, member_share, and account table since we need username, title of book, as well as decsiprtion
        	ResultSet rs = stmt.executeQuery("SELECT account.user_name, book.title, book.description FROM book, member_share, account WHERE account.account_id = member_share.sender_id AND member_share.book_id = book.book_id AND member_share.receiver_id = '" + account_num + "'");
        	int incrementer = 0;
        	while (rs.next()) {
                out.println("<tr> <td>" + rs.getString("account.user_name") + "</td> <td>" +
                rs.getString("title") + "</td><td>" + rs.getString("description") + "</td></tr>");
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
</html></html>