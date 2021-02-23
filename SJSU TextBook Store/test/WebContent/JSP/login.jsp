<%@ page import="java.sql.*"%>
<html>

<!-- Links to css page -->
<head>
	<title>Login</title>
	<link rel="stylesheet" href=..css/design.css>

</head>

<!-- Header with navigation bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./initial_homepage.jsp">Home</a> <a href="./books_display_guest.jsp">Books</a>

		<div class="search-container">
			<form action="books_display.jsp" method = "post">
				<input type="text" placeholder="Search..." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>
		
		<div class="account">
			
		</div>
	</div>
</div>


<!-- Displays the login form for a user to enter their account information -->
<body>
	<div class="section1">
		<div class="button-box">
			<div id="btn"></div>
			<button type="button" class="toggle-btn" onclick="login()">Log
				In</button>
			<button type="button" class="toggle-btn" onclick="signup()">Register</button>
		</div>
		<form id="login" class="input-group"
			action="<%=request.getContextPath()%>/login" method="post">
			<input type="text" class="input-field" name="username"
				placeholder="username" required> <input type="password"
				class="input-field" name="password" placeholder="password" required>

			<button type="submit" class="submit-btn" name="login">Log in</button>
		</form>

		<form id="signup" class="input-group"
			action="<%=request.getContextPath()%>/Signup" method="post">
				
               <% if (request.getAttribute("used_login") != null){ 
               out.print(request.getAttribute("used_login"));} %>
			<input type="text" class="input-field" name="sjsuID" maxlength = "10"
				placeholder="SJSU ID" required> <input type="text"
				class="input-field" name="firstName" placeholder="First Name" required>


			<input type="text" class="input-field" name="lastName"
				placeholder="Last Name" required> <input type="text"
				class="input-field" name="username" placeholder="User Name" required>


			<input type="password" class="input-field" name="password"
				placeholder="Password" required>

			<button type="submit" class="submit-btn" name="signup" value="Signup">Register</button>
		</form>
		
		
		<form class = "admin">
		<a href="./AdminLogin.jsp">Admin Login</a>
		</form>
		
		<br>
		
	</div>

	<!-- Javascript that makes the delete and add forms more interactive -->
	<script>
		var x = document.getElementById("login");
		var y = document.getElementById("signup");
		var z = document.getElementById("btn");
		function signup() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0px";
		}
		
	</script> 
	

	
	<% //Checks the database to see if user exists
	String username = request.getParameter("username");
	try {
		// Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
				"N00bcakes");
		String searchQuery = ("SELECT * FROM sjsu_textbookstore.account where user_name = ?");
		
		PreparedStatement prepared = connection.prepareStatement(searchQuery);
		prepared.setString(1, username);
		ResultSet result1 = prepared.executeQuery();
		boolean check = result1.next();
		if(check) {
			out.println("<b>Your shopping cart is empty <br> Please add items you wish to purchase</b> <br>");
			
		}else
		{
			out.println("<html> <h1></h1></html>");
		}
		}catch(SQLException e) { 
            out.println("SQLException caught: "); 
		}
	%>
	</body>

<!-- Footer of page contains link to about page -->
<footer>
	<a href="./about.jsp">About</a>
</footer>

</html>