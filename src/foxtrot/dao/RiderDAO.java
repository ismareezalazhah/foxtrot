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

public class RiderDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	//Validate Staff Login
		public String authorizeLogin(Rider ri) // create authorize function
		{	
			int riderid = ri.getRiderid();
			String riderPassword = ri.getRiderPassword();
			
			int dbusername = 0;
			String dbpassword = "";
		
			try
			{
				con = ConnectionManager.getConnection();
				ps = con.prepareStatement("SELECT * FROM rider where riderid = ? and riderPassword = ?");
				ps.setInt(1, riderid);
				ps.setString(2, riderPassword);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					dbusername = rs.getInt("riderid");   		//fetchable database record store in dbusername and dbpassword
					dbpassword = rs.getString("riderPassword");
					
					if(riderid == dbusername && riderPassword.equals(dbpassword))
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
	
	
	
	//SELECT ALL RIDER LIST
	public static List <Rider> selectAllAvailableRider(){
		//using try-with-resources to avoid closing resources (boiler plate code)
		List <Rider> rider = new ArrayList <Rider> ();
		
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM rider WHERE riderStatus = \"available\"");
			
			while(rs.next()) {
				Rider r = new Rider();
				
				r.setRiderid(rs.getInt("riderid"));
				r.setRiderName(rs.getString("riderName"));

				rider.add(r);

			}
		}	catch (SQLException e) {
			e.printStackTrace();
			}
		return rider;
	}
	
	
	//SELECT ALL RIDER LIST
		public static List <Rider> selectAllRider(){
			//using try-with-resources to avoid closing resources (boiler plate code)
			List <Rider> ri = new ArrayList <Rider> ();
			
			try {
				con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("select * from rider");
				
				while(rs.next()) {
					Rider r = new Rider();
					
					r.setRiderid(rs.getInt("riderid"));
					r.setRiderName(rs.getString("riderName"));
					r.setRiderPassword(rs.getString("riderPassword"));
					r.setRiderPhone(rs.getString("riderPhone"));
					r.setRiderStatus(rs.getString("riderStatus"));

					ri.add(r);

				}
			}	catch (SQLException e) {
				e.printStackTrace();
				}
			return ri;
		}
	
	
	//SELECT RIDER BASED ON ID (RIDER DETAILS)
	public static Rider selectRiderById(int riderid) {
		Rider ri = new Rider();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from rider where riderid =?");
			
			ps.setInt(1, riderid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ri.setRiderid(rs.getInt("riderid"));
				ri.setRiderName(rs.getString("riderName"));
				ri.setRiderPassword(rs.getString("riderPassword"));
				ri.setRiderPhone(rs.getString("riderPhone"));
				ri.setRiderStatus(rs.getString("riderStatus"));
			    
			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return ri;
	}
	
	
	//SELECT RIDER BASED ON ORDERID (RIDER DETAILS IN CUSTOMER VIEW ORDER DETAILS)
		public static Rider selectRiderByOrderId(int orderid) {
			Rider ri = new Rider();
			
			try {
				con = ConnectionManager.getConnection();
				ps = con.prepareStatement("select riderid,riderName,riderPhone from orders JOIN rider USING (riderid) where orderid =?");
				
				ps.setInt(1, orderid);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					ri.setRiderid(rs.getInt("riderid"));
					ri.setRiderName(rs.getString("riderName"));
					ri.setRiderPhone(rs.getString("riderPhone"));
				    
				}
			}	catch (SQLException e) {
				e.printStackTrace();
			}
			return ri;
		}
	
	
	
	
	//ADD NEW RIDER
	public void addRider(Rider ri) {
		
		String riderName = ri.getRiderName();
		String riderPassword = ri.getRiderPassword();
		String riderPhone = ri.getRiderPhone();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("insert into rider (riderName,riderPassword,riderPhone) values (?,?,?)");
			
			ps.setString(1, riderName);
			ps.setString(2, riderPassword);
			ps.setString(3, riderPhone);

			ps.executeUpdate();
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	//UPDATE RIDER DETAILS
	public void updateRiderDetails(Rider ri) {
		
		int riderid = ri.getRiderid();
		String riderName = ri.getRiderName();
		String riderPassword = ri.getRiderPassword();
		String riderPhone = ri.getRiderPhone();
		String riderStatus = ri.getRiderStatus();

		
		try {
			con = ConnectionManager.getConnection();
			String query ="UPDATE rider SET riderid= '"+ riderid +"', riderName= '"+ riderName +"', riderPassword= '"+ riderPassword +"', riderPhone= '"+ riderPhone +"', riderStatus= '"+ riderStatus +"' WHERE riderid='"+ riderid +"'";                       
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	//DELETE RIDER
	public void deleteRider(int riderid) {
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("delete from rider where riderid =?");
			
			ps.setInt(1, riderid);
			ps.executeUpdate();
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
}
