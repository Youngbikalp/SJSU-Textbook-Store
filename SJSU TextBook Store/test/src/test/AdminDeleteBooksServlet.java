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
 * Servlet implementation class AdminDeleteBooksServlet
 */
@WebServlet("/deletebooks")
public class AdminDeleteBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private AdminDeleteBooksDAO deleteBooksDao = new AdminDeleteBooksDAO();

	public AdminDeleteBooksServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String book_id = request.getParameter("book_id");

		try {
			// Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
					"N00bcakes");

			Book book = new Book(book_id);
			book.setTitle(book_id);

			try {
				/*
				 * This function selects the books id from the form which the admin inputed,
				 * after that it is deleted from the database using the query, it also deletes
				 * it from the admin_book, since if the admin was managing the book, and it is
				 * no longer in the database, so it would be logical to delete it from
				 * admin_book table as well, so that are no longer managing that book which was
				 * deleted
				 */
				deleteBooksDao.deleteBook(book);
				String searchQuery = ("SELECT book.book_id FROM sjsu_textbookstore.book where book_id = ?");
				PreparedStatement prepared = connection.prepareStatement(searchQuery);
				prepared.setString(1, book_id);
				ResultSet result1 = prepared.executeQuery();
				result1 = prepared.executeQuery();
				while (result1.next()) {
					String admin_id = (String) request.getSession().getAttribute("adminid");
					// Deletes the book from the admin_book
					String query = "DELETE FROM (admin_id,book_id) VALUES ('" + admin_id + "', '"
							+ result1.getInt("book_id") + "')";
					PreparedStatement prepared1 = connection.prepareStatement(query);
					prepared1.execute();
				}
				response.sendRedirect("JSP/admin_books.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("SQLException caught: " + e.getMessage());
			}
		} catch (SQLException e) {

		}
	}

}
