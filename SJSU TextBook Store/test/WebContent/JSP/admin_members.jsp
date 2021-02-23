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
	<% //Selects username of a member that is managed by this admin and displays result on webpage
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String admin_id=(String)request.getSession().getAttribute("adminid");
		String query = "SELECT user_name from admin where admin_id = ?";
		PreparedStatement prepared = connection.prepareStatement(query);  
    	prepared.setString(1, admin_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while(rs.next()){
			out.println("<h1>Members managed by " + rs.getString("user_name") + "</h1>");
		}
	} catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
	%>
	
		<!-- Table that displays all the members information  -->
		<table class="table-desgin-two">
			<tr>
				<th>Account ID</th>
				<th>SJSU ID</th>
				<th>Username</th>
				<th>First Name</th>
				<th>Last Name</th>			
			</tr>		
			<% /**Establish connection of database and then retrieve information about members that are mananged by
				this admin.  Displays sjsu id, first name, and last name.
			**/
try{
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false","root", "N00bcakes");
		String admin_id=(String)request.getSession().getAttribute("adminid");
		String query = "SELECT account.account_id,sjsu_id, account.user_name, first_name, last_name from account,admin_members where admin_id = ? AND admin_members.account_id = account.account_id";	
		PreparedStatement prepared = connection.prepareStatement(query);  
    	prepared.setString(1, admin_id);
		ResultSet rs = prepared.executeQuery();
		rs = prepared.executeQuery();
		while (rs.next()) {
            out.println("<tr><td>" +rs.getString("account_id")+"</td><td>" + rs.getString("sjsu_id") + "</td> <td>" +
            rs.getString("user_name") + "</td><td>" + rs.getString("first_name") + "</td><td>" + rs.getString("last_name") +"</td></tr>");
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