package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class dbconnBook {
	private static Connection conn = null;
	ResultSet rs = null;
	Properties prop = new Properties();
	String serverName = "localhost";
	 String url = "jdbc:mysql://localhost:3306/bookstore";
	 private static Connection connection;
	public dbconnBook() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			prop.put("charSet","gb2312");
			prop.put("user","root");
			prop.put("password","123456");
		}
		catch(java.lang.ClassNotFoundException e) {
			System.err.println( e.getMessage());
		}
	}
	public ResultSet executeQuery(String sql) {
		try {
			conn = DriverManager.getConnection(url,prop);
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} 
		catch(SQLException ex) { 
			System.err.println(ex.getMessage());
		}
		return rs;
	}
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(url,prop); 
			Statement stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} 
		catch(SQLException ex) { 
			System.err.println(ex.getMessage());
		}
		return result;
	}
	public static Connection getMySqlConnection() {
		
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "123456");
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return conn;
	}
	public void closeConn(){
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
			System.err.println(e.getMessage());
		}
	}
}
