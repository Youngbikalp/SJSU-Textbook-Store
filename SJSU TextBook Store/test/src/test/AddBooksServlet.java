package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBooksServlet
 */
@WebServlet("/addbooks")
public class AddBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	private AddBooksDAO addBooksDao = new AddBooksDAO();

	public AddBooksServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * This is getting the information that the user inputted into the form
		 */
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String author = request.getParameter("author");
		String isbn = request.getParameter("isbn");
		String price = request.getParameter("price");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
					"N00bcakes");

			Book book = new Book(title, description, author, isbn, price);
			book.setTitle(title);
			book.setDescription(description);
			book.setAuthor(author);
			book.setISBN(isbn);
			book.setPrice(price);

			try {

				/*
				 * Since the admin can manage the book, what this code is doing is, first
				 * getting the book id, from the title, which the admin added after that in the
				 * addmin_books there are two tables admin_id and book_id, the session gets the
				 * admin id and the book title is fetched from the book table, finally we add
				 * the admin id and book id, which is managed by the admin. There is a request
				 * function where the user can request books, and the request book has request
				 * id, account id and title, if the admin inserts the books that was requested,
				 * it checks for the title from the request books table and deletes the book
				 * from the table if the admin adds the book that was requested.
				 */
				addBooksDao.addBook(book);
				String searchQuery = ("SELECT book.book_id FROM sjsu_textbookstore.book where title = ?");
				PreparedStatement prepared = connection.prepareStatement(searchQuery);
				prepared.setString(1, title);
				ResultSet result1 = prepared.executeQuery();
				result1 = prepared.executeQuery();
				while (result1.next()) {
					String admin_id = (String) request.getSession().getAttribute("adminid");
					String query = "INSERT INTO admin_books (admin_id,book_id) VALUES ('" + admin_id + "', '"
							+ result1.getInt("book_id") + "')";
					PreparedStatement prepared1 = connection.prepareStatement(query);
					prepared1.execute();
				}
				String query1 = ("DELETE from request_books where title = ?"); // deleting the book from the request
																				// table
				PreparedStatement prepared1 = connection.prepareStatement(query1);
				prepared1.setString(1, title);
				prepared1.executeUpdate();
				response.sendRedirect("JSP/admin_books.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("SQLException caught: " + e.getMessage());
			}
		} catch (SQLException e) {

		}

	}
}
