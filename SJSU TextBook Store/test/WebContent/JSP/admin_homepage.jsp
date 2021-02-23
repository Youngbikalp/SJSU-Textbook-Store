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
		<a href="./admin_homepage.jsp">Home</a> <a href="./AdminAddBooks.jsp">Manage
			Books</a> <a href="./AdminManageMembers.jsp">Manage Members</a> <a
			href="./AdminViewBooks.jsp">View Books</a>
		<div class="account">
			<a href="./initial_homepage.jsp">LogOut</a>
		</div>

	</div>
</div>

<!-- Admin home page is displayed with the bookstore logo, and links to 
access admin_books, admin_members, and manageRequestBooks -->
<body>
	<section>
		<h1>Hello, Admin!</h1>
		<img src="../img/157A_d.png" width="250" height="250">
		<br><br><br><br><br><br>
	<div class="aButton">
		<a href="./admin_books.jsp">Books</a> 
		<a href="./admin_members.jsp">Members</a> 
		<a href="./ManageRequestBooks.jsp">Requested Books</a> 			
	</div>
 	<br><br> 
	</section>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	<a href="./about.jsp">About</a>
</footer>
</html>