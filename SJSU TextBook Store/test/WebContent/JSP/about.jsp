<html>
<!-- Links to css page -->
<head>
	<title>About</title>
	<link rel="stylesheet" href=../css/design.css>
</head>

<!-- Header with navigation bar -->
<div class="top">
	<h1>SJSU STUDENT BOOK STORE</h1>
	<div class="navbar">
		<a href="./member_homepage.jsp">Home</a> <a href="./books_display.jsp">Books</a>

		<div class="search-container">
			<form action="books_display.jsp" method = "post">
				<input type="text" placeholder="Search..." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>Go
				</button>
			</form>
		</div>
		
		<div class="account">
			<a href="./checkout.jsp">CheckOut</a><a href="./account.jsp">Account</a> <a href="./initial_homepage.jsp">Log Out</a>
		</div>

	</div>
</div>


<!-- Contains project statement -->
<body>
	<section>
		<h1>Mission</h1>
		<img src="../img/157A_d.png" width= "250" height="250">


		<p> SJSU Student BookStore have a convenient, minimalist way to shop for college textbooks within the SJSU community. 
		Users will have an opportunity to sell their old textbooks and browse through the database to find or buy textbooks. 
		This application will have a user-friendly interface that enables users to easily maneuver through the application. 
		Although SJSU has a bookstore, the bookstore is more of a marketplace. The SJSU bookstore sells more than just textbooks. 
		The products in the bookstore range from clothing to food. 
		The motivation behind this application is to solely focus on textbooks.
		</p>

	</section>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	 <a href="./about.jsp">About</a>
</footer>
</html>