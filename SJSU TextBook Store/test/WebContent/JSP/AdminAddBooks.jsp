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
		<a href="./admin_homepage.jsp">Home</a> <a href="./admin_books.jsp">Books</a><a href="./admin_members">Members</a>
			 <a href="./AdminManageMembers.jsp">Manage Members</a> <a
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


<!-- Admin has option to add or delete books from the database system. Admin must fill out 
a form of the book they want to add or delete. -->
<body>
	<div class="section1">
		<div class="button-box">
			<div id="btn"></div>
			<button type="button" class="toggle-btns" onclick="addbook()">Add
				Books</button>
			<button type="button" class="toggle-btns" onclick="deletebook()">Delete
				Books</button>
		</div>
		<!-- DISPLAY Login FORM -->
		<form id="addbooks" class="input-group"
			action="<%=request.getContextPath()%>/addbooks" method="post">
			<input type="text" class="input-field" name="title"
				placeholder="Title" required> <input type="text"
				class="input-field" name="description" placeholder="Description"
				required> <input type="text" class="input-field"
				name="author" placeholder="Author" required> <input
				type="text" class="input-field" name="isbn" placeholder="ISBN" maxlength = "10"
				required> <input type="text" class="input-field"
				name="price" placeholder="price" required>


			<button type="submit" class="submit-btn" name="addbooks">Add
				Book</button>

		</form>

		<form id="deletebooks" class="input-group"
			action="<%=request.getContextPath()%>/deletebooks" method="post">

			<input type="text" class="input-field" name="book_id"
				placeholder="Book ID" required>

			<button type="submit" class="submit-btn" name="deletebooks"
				value="deletebooks">Delete Book</button>
		</form>

		<br>
	</div>

	<!-- Javascript that makes the delete and add forms more interactive -->
	<script>
		var x = document.getElementById("addbooks");
		var y = document.getElementById("deletebooks");
		var z = document.getElementById("btn");
		function addbook() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
		function deletebook() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0px";
		}
	</script> 
</body>

<!-- Footer of page contains link to about page -->
<footer>
	<a href="./about.jsp">About</a>
</footer>

</html>