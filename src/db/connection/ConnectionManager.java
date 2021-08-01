package db.connection;

import java.sql.*;

public class ConnectionManager {
	static Connection con;
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_82bd4eac5871c46";
	private static final String DB_USER = "b83c5dac6a4a40";
	private static final String DB_PASSWORD = "1bbc4399";
	
	
	public static Connection getConnection() {
		
		try {
			Class.forName(DB_DRIVER);
			try {
				con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
				System.out.println("Connected");
			}
			
			catch(SQLException ex) {
				ex.printStackTrace();
			}
			
		}
		
		catch(ClassNotFoundException e) {
			System.out.println(e);
		}
		return con;
	}
}
