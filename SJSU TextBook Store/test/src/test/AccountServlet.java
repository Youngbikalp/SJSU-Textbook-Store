package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/Signup")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	private AccountDAO accountDao = new AccountDAO();

	public AccountServlet() {
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/signup.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) // getting the user input from the
																					// form text box
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String sjsuID = request.getParameter("sjsuID");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		Random random = new Random();
		int rand = random.nextInt(3) + 1;

		try {
			// Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
					"N00bcakes");
			Account account = new Account();
			account.setSjsuID(sjsuID);
			account.setLastname(lastName);
			account.setPassword(password);
			account.setFirstName(firstName);
			account.setUsername(username);
			try {
				accountDao.register(account);
				/*
				 * When the user signs up, there are 3 admin and it will randomly place the user
				 * under one of the 3 admins. So first it's getting the account id, by selecting
				 * the user_name that was just signed up, and then it adds a random value from 1
				 * to 3, to match on of the admins, so that the user who recently signed up,
				 * they are managed by one of the admin.
				 */
				String searchQuery = ("SELECT account.account_id FROM sjsu_textbookstore.account where user_name = ?");
				PreparedStatement prepared = connection.prepareStatement(searchQuery);
				prepared.setString(1, username);
				ResultSet result1 = prepared.executeQuery();
				result1 = prepared.executeQuery();
				while (result1.next()) {
					// String admin_id=(String)request.getSession().getAttribute("adminid");
					String query = "INSERT INTO admin_members (admin_id,account_id) VALUES ('" + rand + "', '"
							+ result1.getInt("account_id") + "')";
					PreparedStatement prepared1 = connection.prepareStatement(query);
					prepared1.execute();
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("SQLException caught: " + e.getMessage());
			}

		} catch (SQLException e) {

		} finally {
			Connection connection;
			try {
				/*
				 * This is to check if the user already exists, this will check the database if
				 * there is a duplicate username if there is it will take the users to the
				 * duplicate username where there is a message that states, please select a
				 * different username otherwise, they can login.
				 */

				connection = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
						"N00bcakes");
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT user_name from account where user_name = '" + username + "'");
				boolean same_username = rs.next();
				if (same_username == false) {
					response.sendRedirect("JSP/member_homepage.jsp");
				} else {
					response.sendRedirect("JSP/DuplicateUsername.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}