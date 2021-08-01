package foxtrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.connection.ConnectionManager;
import foxtrot.model.*;




public class StaffDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	//Validate Staff Login
	public String authorizeLogin(Staff s) // create authorize function
	{	
		int staffid = s.getStaffid();
		String staffPassword = s.getStaffPassword();
		String staffCategory = s.getStaffCategory();
		
		int dbusername = 0;
		String dbpassword = "";
		String dbcategory = "";
	
		try
		{
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("SELECT * FROM staff where staffid = ? and staffPassword = ? and staffCategory =?");
			ps.setInt(1, staffid);
			ps.setString(2, staffPassword);
			ps.setString(3, staffCategory);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				dbusername = rs.getInt("staffid");   		//fetchable database record store in dbusername and dbpassword
				dbpassword = rs.getString("staffPassword");
				dbcategory = rs.getString("staffCategory");
				
				if(staffid == dbusername && staffPassword.equals(dbpassword) && staffCategory.equals(dbcategory))
				{
					return "SUCCESS LOGIN";
				}		
			}
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "WRONG USEREMAIL AND PASSWORD";
	}
	
	
	//SELECT ALL STAFF LIST
	public static List <Staff> selectAllStaff(){
		//using try-with-resources to avoid closing resources (boiler plate code)
		List <Staff> st = new ArrayList <Staff> ();
		
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from staff");
			
			while(rs.next()) {
				Staff s = new Staff();
				
				s.setStaffid(rs.getInt("staffid"));
				s.setStaffName(rs.getString("staffName"));
				s.setStaffPassword(rs.getString("staffPassword"));
				s.setStaffPhone(rs.getString("staffPhone"));
				s.setStaffCategory(rs.getString("staffCategory"));

				st.add(s);

			}
		}	catch (SQLException e) {
			e.printStackTrace();
			}
		return st;
	}
	
	
	//SELECT STAFF BASED ON ID (STAFF DETAILS)
	public static Staff selectStaffById(int staffid) {
		Staff st = new Staff();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from staff where staffid =?");
			
			ps.setInt(1, staffid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				st.setStaffid(rs.getInt("staffid"));
				st.setStaffName(rs.getString("staffName"));
				st.setStaffPassword(rs.getString("staffPassword"));
				st.setStaffPhone(rs.getString("staffPhone"));
				st.setStaffCategory(rs.getString("staffCategory"));
			    
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return st;
	}
	
	
	//ADD NEW STAFF
	public void addStaff(Staff st) {
		
		String staffName = st.getStaffName();
		String staffPassword = st.getStaffPassword();
		String staffPhone = st.getStaffPhone();
		String staffCategory = st.getStaffCategory();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("insert into staff (staffName,staffPassword,staffPhone,staffCategory) values (?,?,?,?)");
			
			ps.setString(1, staffName);
			ps.setString(2, staffPassword);
			ps.setString(3, staffPhone);
			ps.setString(4, staffCategory);

			ps.executeUpdate();
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	
	//UPDATE STAFF DETAILS
	public void updateStaffDetails(Staff st) {
		
		int staffid = st.getStaffid();
		String staffName = st.getStaffName();
		String staffPassword = st.getStaffPassword();
		String staffPhone = st.getStaffPhone();
		String staffCategory = st.getStaffCategory();

		
		try {
			con = ConnectionManager.getConnection();
			String query ="UPDATE staff SET staffName= '"+ staffName +"', staffPassword= '"+ staffPassword +"', staffPhone= '"+ staffPhone +"', staffCategory= '"+ staffCategory +"' WHERE staffid='"+ staffid +"'";                       
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	//DELETE STAFF
	public void deleteStaff(int staffid) {
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("delete from staff where staffid =?");
			
			ps.setInt(1, staffid);
			ps.executeUpdate();
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
