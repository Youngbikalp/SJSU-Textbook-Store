<%@ page import="java.sql.*, java.util.Date, java.io.*"%>

<html>
<!-- Links to css page -->
<head>
	<title>Book</title>
	<link rel="stylesheet" href=../css/design.css>
</head>

<!-- Header with navigation and search bar -->
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
			<a href="./account.jsp">Account</a> <a href="./initial_homepage.jsp">Log Out</a>
		</div>

	</div>
</div>



<body>
	<section>
		<h1>Checkout</h1>
		<!-- Form to enter the book that you wish to delete from cart -->
		<form  action = "./checkout.jsp" method = "POST" class="input-group-1" > 
			<input class = "input-field-1" type= "text" placeholder="Enter the Book You Wish to Delete from Cart" name= "booksToDelete" />
		</form>

		<%
		 String userDelete = request.getParameter("booksToDelete");
		 String database = "sjsu_textbookstore";
	     String users; 
	     users = "root";
	     String passwords = "N00bcakes";
	
	     try {      
	         	java.sql.Connection con; 
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false",users, passwords);
				//Create sql statement
		        Statement stmt = con.createStatement();
		        if(userDelete != null)
		        {     	
			        ResultSet rs = stmt.executeQuery("SELECT * FROM book WHERE title = '"+userDelete+"'");
			        boolean empty = rs.next(); 
		            //If no results are found then display message 
		            if(empty == false)
		            {
		            	out.println("<b>Please enter a valid book to delete</b><br>");	
		            }
		            //Display the results from the query given by the user, the book is stored in the database for recently searched
		            else
		            {
		            	String query = "DELETE FROM checkout WHERE title = '"+userDelete+"'";	
		            	PreparedStatement prepared = con.prepareStatement(query);
		            	prepared.execute();
		            }	  
		            //Close connections
		            rs.close();
		            stmt.close();
		            con.close();   
	        	}	        
	     } catch(SQLException e) { 
	            out.println("SQLException caught: " + e.getMessage()); 
	        }        	
	    	
		%>
		<table class = table-desgin-two>
			<tr>
				<th>Title</th>
				<th>Book Description</th>
				<th>Author</th>
				<th>Price </th>
			</tr>
		
			<% 
	 int sum = 0;
  	 String userInput = request.getParameter("search");
     String db = "sjsu_textbookstore";
     String user; // assumes database name is the same as username
     user = "root";
     String password = "N00bcakes";
     try {       
         	java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?serverTimezone=EST5EDT",user, password);           
	        Statement stmt = con.createStatement();
	        Date date = new Date(); 
	        Timestamp ts = new Timestamp(date.getTime());
	        int rand = (int)Math.floor(Math.random() * 10000) + 1;
	        int rand2 = (int)Math.floor(Math.random() * 10000) + 1;
	        ResultSet rs = stmt.executeQuery("SELECT * FROM book, checkout WHERE book.book_id = checkout.book_id AND checkout.account_id = account_id");        //'" + userInput + "'");
	        boolean empty = rs.next();       
	        if(empty == false)
	        {
	            	
	            	out.println("<b>Your shopping cart is empty <br> Please add items you wish to purchase</b> <br>");	
	        }
	        else
	        {
		           while (rs.next()) 
		           {
		                out.println("<tr><td>" + rs.getString("title") + "</td> <td>" +
		                rs.getString("description") + "</td><td>" + rs.getString("author") + "</td><td> $" + rs.getString("price") +"</td></tr>");
		                sum = sum + rs.getInt("price");
		           }
	          }	          
	          out.println("<tr><th></th><th></th><th>Total price</th><th> $" + sum + "</th></tr>");
	          //Close connections
	          rs.close();
	          stmt.close();
	          con.close();
         	
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
         	
    	%>

   		</table>
	 	<br>
		
		<!-- Form for user to confirm their purchase -->
		<form  action = "./checkout.jsp" method = "POST" class="input-group-1" > 
			<input class = "input-field-1" type= "text" placeholder="Type 'YES' in bar to confirm purchase" name= "confirmation" />
		</form>
		<%
		//Inserts items purchased into the purchase table and removes data from checkout since purchase has processed 
		String yes = request.getParameter("confirmation");
	    String users2; 
	    users2 = "root";
	    String passwords2 = "N00bcakes";
		int total = 0;
	    try {      
	         	java.sql.Connection con; 
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?serverTimezone=EST5EDT",users2, passwords2);
		        String account_id=(String)request.getSession().getAttribute("userid");
		        String query = "Select book.price, checkout.account_id, checkout.book_id from checkout,book where account_id = ? AND book.book_id = checkout.book_id; ";
		        if(yes != null && (yes.equals("yes") || yes.equals("YES") || yes.equals("Yes") || yes.equals("YEs") || yes.equals("YeS")))
		        {
		        	PreparedStatement prepared = con.prepareStatement(query);  
	            	prepared.setString(1, account_id);
	    			ResultSet rs = prepared.executeQuery();
	    			rs = prepared.executeQuery();	    			
			        boolean empty = rs.next(); 		           
		            if(empty != false)
		            {
		            	//Inserts items purchased into the purchase table
		            	while(rs.next()){
			            	String query1 = "INSERT INTO purchase (account_id,book_id, price ) VALUES ('"+rs.getInt("account_id")+"', '"+rs.getInt("book_id")+"','"+rs.getInt("price")+"')";	
			            	PreparedStatement prepared1 = con.prepareStatement(query1);
			            	prepared1.execute();
		            	}
		            	//Delete all items from checkout table after checkout has been processed
			            String query2 = "DELETE FROM checkout";	
			            PreparedStatement prepared2 = con.prepareStatement(query2);
			            prepared2.execute();
		            }
		            //Display the results from the query given by the user, the book is stored in the database for recently searched
		            else
		            {
		            	out.println("<b>No items ordered</b><br>");
		            	   
		            }
					//close connections            
		            rs.close();
		            con.close();		            
	        	}
		        else
		        {
		        	out.println("<b>Please confirm order by typing yes</b><br>");	
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