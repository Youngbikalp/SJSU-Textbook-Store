<%@ page import="java.sql.*"%>
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
		<a href="./admin_homepage.jsp">Home</a><a href="./AdminAddBooks.jsp">Manage
			Books</a> <a href="./AdminManageMembers.jsp">Manage Members</a> <a
			href="./AdminViewBooks.jsp">View Books</a>
		<div class="search-container">
			<form action="AdminViewBooks.jsp" method="post">
				<input type="text" placeholder="Search by Author or Title"
					name="search">
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


<!-- html code that displays a form where admin can delete members from the system -->
<body>
	<div class="section1">
		<div class="button-box">
			<div id="btn"></div>
			<button type="button" class="toggle-btn" onclick="addbook()">Delete Members</button>
		</div>
		<form id="addbooks" class="input-group"
			action="<%=request.getContextPath()%>/deletemembers" method="post"> 
			<input type="text" class="input-field" name="account_id"
				placeholder="Account ID" required> 
			<button type="submit" class="submit-btn" name="deletemembers">Delete Member</button>
		</form>
		<br>
	</div>
</body>

<!-- Footer of page contains link to about page -->
<footer>
	<a href="./about.jsp">About</a>
</footer>

</html>