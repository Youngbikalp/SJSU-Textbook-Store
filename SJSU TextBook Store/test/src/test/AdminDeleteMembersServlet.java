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
 * Servlet implementation class AdminDeleteMembersServlet
 */
@WebServlet("/deletemembers")
public class AdminDeleteMembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private AdminDeleteMembersDAO deleteMembersDao = new AdminDeleteMembersDAO();

	public AdminDeleteMembersServlet() {
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
		String account_id = request.getParameter("account_id");

		try {
			// Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sjsu_textbookstore?autoReconnect=true&useSSL=false", "root",
					"N00bcakes");

			Account account = new Account();
			account.setAccount_id(account_id);
			;

			try {
				/*
				 * Admins can delete users, when they input the accoun_id into the form, it is
				 * compared inside the database and when it matched it is selected, after that
				 * the delete query deletes the user from the account tables and form the
				 * admin_members table so they are no longer managed by the admin.
				 */
				deleteMembersDao.deleteMember(account);
				String searchQuery = ("SELECT account.account_id FROM sjsu_textbookstore.account where account_id = ?");
				PreparedStatement prepared = connection.prepareStatement(searchQuery);
				prepared.setString(1, account_id);
				ResultSet result1 = prepared.executeQuery();
				result1 = prepared.executeQuery();
				while (result1.next()) {
					String admin_id = (String) request.getSession().getAttribute("adminid");
					String query = "DELETE FROM (admin_id,account_id) VALUES ('" + admin_id + "', '"
							+ result1.getInt("account_id") + "')";
					PreparedStatement prepared1 = connection.prepareStatement(query);
					prepared1.execute();
				}
				response.sendRedirect("JSP/admin_members.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("SQLException caught: " + e.getMessage());
			}
		} catch (SQLException e) {

		}
	}
}
