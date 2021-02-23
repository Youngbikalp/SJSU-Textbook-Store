package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Mysqlcon 
{
	public static void main(String[] args) throws Exception
	{
		try {
			//Class.forName("com.mysql.jdbc.Driver");
	
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/SJSU_TextBookStore?autoReconnect=true&useSSL=false","root","root");
			Statement stmt=con.createStatement();
			
			//NEED TO CHANGE OR UPDATE
			ResultSet rs=stmt.executeQuery("select * from cs157a.emp");
			while (rs.next())
			{
				System.out.println("<br>"+rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		/*
	
	*/
	}
	}
}
