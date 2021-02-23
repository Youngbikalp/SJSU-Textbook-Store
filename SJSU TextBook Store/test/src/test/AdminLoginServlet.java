package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/Adminlogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginServlet() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		AdminLoginDAO adminlogindao = new AdminLoginDAO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String admin_id = null;
		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
					"N00bcakes");

			// Selecting admin id by selecting the username which the user inputed from the
			// form
			String query = "SELECT admin_id From sjsu_textbookstore.admin where user_name = ?";
			PreparedStatement prepared = connection.prepareStatement(query);
			prepared.setString(1, username);
			ResultSet result = prepared.executeQuery();
			result = prepared.executeQuery();
			while (result.next()) {
				admin_id = result.getString("admin_id");
			}
			// creating a http session for admin if the username and password was entered
			// correctly
			if (ValidateUser(username, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("adminid", admin_id);
				response.sendRedirect("JSP/admin_homepage.jsp");
			} else {
				// otherwise it is redirecting it to the login page
				response.sendRedirect("JSP/login.jsp");
			}

		} catch (Exception e) {
			System.out.println("Connection Failed: " + e.toString());
		}
	}

	/*
	 * At first it selects the username from the database which was entered in the
	 * form, after that it checks the database for password and salt, finally it
	 * hashes and concatenates the password and salt and if it matches it in the
	 * database, then the admin is validated.
	 */
	protected boolean ValidateUser(String username, String password) {
		String valid_password = null;
		Connection connection = null;
		try {
			try {
				connection = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
						"N00bcakes");
			} catch (Exception e) {
				System.out.println("Connection Failed: " + e.toString());
			}
			PreparedStatement prepared = null;
			String password_from_db;
			String salt1;
			try {
				prepared = connection.prepareStatement("SELECT * FROM  sjsu_textbookstore.admin WHERE user_name =?");
				prepared.setString(1, username);
				ResultSet result = prepared.executeQuery();

				if (result.next()) {
					password_from_db = result.getString("password");
					salt1 = result.getString("salt1");
					// hash user input here with the salt
					result.close();
					prepared.close();
					prepared = connection.prepareStatement(
							"Select * from admin where user_name =  ? AND password = sha2(CONCAT( ?, salt1),256);");
					prepared.setString(1, username);
					prepared.setString(2, password);

					result = prepared.executeQuery();
					if (result.next()) { // user logged in
						// User is logged in
						return true;
					} else {
						// not logged in

						return false;
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Cannot validate the account");
				return false;
			}

			finally {

				if (prepared != null) {
					try {
						prepared.close();
					} catch (SQLException e) {
						/* ignored */}
				}
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						/* ignored */}
				}

			}
		} finally {
		}

		return false; // when user makes error in their login it will always return error.

	}
}
