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
			 <a href="./login.jsp">Log In</a>
		</div>

	</div>
</div>
<head>


<!-- Displays a welcome page with SJSU bookstore logo -->
<body>
	<section>
		<h1>Welcome to Student Bookstore!</h1>
		<img src="../img/157A_d.png" width="250" height="250">
		<p>Come check out our books.</p>
		<p>Search books through our database</p>
		<p>Find books by title, author, and ISBN.</p>
		<p>Easy to buy textbooks for your courses.</p>
	</section>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	 <a href="./about.jsp">About</a>
</footer>
</html>