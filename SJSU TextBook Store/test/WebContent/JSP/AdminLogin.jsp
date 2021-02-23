<html>

<!-- Links to css page -->
<head>
<title>Login</title>
<link rel="stylesheet" href=../css/design.css>

</head>

<!-- Header with navigation bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./inital_homepage.jsp">Home</a> <a href="./books_display.jsp">Books</a>

		<div class="search-container">
			<form action="books_display.jsp" method="post">
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


<!-- Html code that displays the login form of the user -->
<body>
	<div class="section1">
		<div class="button-box">
			<div id="btn2"></div>
			<button type="button" class="toggle-btn" onclick="login()">Admin Log In</button>
		</div>
		<!-- DISPLAYs Login FORM -->
		<form id="login" class="input-group"
			action="<%=request.getContextPath()%>/Adminlogin" method="post">
			<input type="text" class="input-field" name="username"
				placeholder="Admin Username" required> <input type="password"
				class="input-field" name="password" placeholder="password" required>
			<button type="submit" class="submit-btn" name="adminlogin">Log in</button>
		</form>
	</div>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	<a href="./about.jsp">About</a>
</footer>

</html>