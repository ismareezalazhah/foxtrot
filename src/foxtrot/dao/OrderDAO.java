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

public class OrderDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	int orderid;
	String orderProgress;
	
	//VIEW ORDER LIST 
		public static List<Order> getAllOrder(){
			
			List<Order> orderlist = new ArrayList<Order>();
			
			try {
				Connection con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * from orders WHERE orderProgress !='Complete' AND orderProgress !='Cancel' ORDER BY orderid ASC");
				//ResultSet rs = stmt.executeQuery("SELECT * from orders WHERE orderProgress !=\"Complete\" ORDER BY orderid ASC");
				while(rs.next())
				{
					Order ol = new Order();
					
					ol.setOrderid(rs.getInt("orderid"));
					ol.setOrderProgress(rs.getString("orderProgress"));
					ol.setOrderDate(rs.getString("orderDate"));
					ol.setOrderTotalPrice(rs.getDouble("orderTotalPrice"));
					ol.setCustEmail(rs.getString("custEmail"));
					ol.setRiderid(rs.getInt("riderid"));
					
					orderlist.add(ol);
				}
			}	catch(SQLException e) {
				e.printStackTrace();
			}
			
			return orderlist;
		}
		
		//VIEW ORDER HISTORY LIST 
				public static List<Order> getAllOrderHistory(){
					
					List<Order> orderhistory = new ArrayList<Order>();
					
					try {
						Connection con = ConnectionManager.getConnection();
						stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("select * from orders where orderProgress = 'Complete' OR orderProgress = 'Cancel' ORDER BY orderDate ASC");
						while(rs.next())
						{
							Order ol = new Order();
							
							ol.setOrderid(rs.getInt("orderid"));
							ol.setOrderProgress(rs.getString("orderProgress"));
							ol.setOrderDate(rs.getString("orderDate"));
							ol.setOrderTotalPrice(rs.getDouble("orderTotalPrice"));
							ol.setCustEmail(rs.getString("custEmail"));
							ol.setRiderid(rs.getInt("riderid"));
							
							orderhistory.add(ol);
						}
					}	catch(SQLException e) {
						e.printStackTrace();
					}
					
					return orderhistory;
				}
		
				
	//VIEW ORDER LIST 
	public static List<Order> getRiderOrder(int riderid){
					
		List<Order> riderorder = new ArrayList<Order>();
					
		try {
			Connection con = ConnectionManager.getConnection();

			ps = con.prepareStatement("SELECT * from orders WHERE orderProgress != 'Complete' AND orderProgress != 'Cancel' AND riderid =? ORDER BY orderid ASC");
			ps.setInt(1, riderid);
			
			ResultSet rs = ps.executeQuery();


			
				while(rs.next())
				{
					Order ro = new Order();
							
					ro.setOrderid(rs.getInt("orderid"));
					ro.setOrderProgress(rs.getString("orderProgress"));
					ro.setOrderDate(rs.getString("orderDate"));
					ro.setOrderTotalPrice(rs.getDouble("orderTotalPrice"));
					ro.setCustEmail(rs.getString("custEmail"));
					ro.setRiderid(rs.getInt("riderid"));
							
					riderorder.add(ro);
				}
			}	catch(SQLException e) {
				e.printStackTrace();
			}
		
		return riderorder;
	}
	
					
					
		//Get Order List For By CustEmail
		public static List<Order> getAllOrderCustomer(String custEmail){
			
			List<Order> orderCust = new ArrayList<Order>();
			
			try {
				Connection con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from orders where custEmail= '"+ custEmail +"' ORDER BY orderid DESC");
				
				while(rs.next())
				{
					Order oc = new Order();
					
					oc.setOrderid(rs.getInt("orderid"));
					oc.setOrderDate(rs.getString("orderDate"));
					oc.setOrderProgress(rs.getString("orderProgress"));
					
					orderCust.add(oc);
				}
			}	catch(SQLException e) {
				e.printStackTrace();
			}
			
			return orderCust;
		}
		
		
		//Get Order ID
		public static int getOrderId(int orderid) {
			
			return orderid;
		}
		
		
		//VIEW ORDER BY ID ( FOR CUSTOMER/STAFF/RIDER VIEW)
		public static Order getOrderById(int orderid) {
			
			System.out.println("orderID : "+ orderid); //debugging purpose
			
			Order or = new Order();
			
			try {
				Connection con = ConnectionManager.getConnection();
				ps = con.prepareStatement("select * from orders where orderid='"+ orderid +"'");
				
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					or.setOrderid(rs.getInt("orderid"));
					or.setOrderProgress(rs.getString("orderProgress"));
					or.setOrderDate(rs.getString("orderDate"));
					or.setOrderTotalPrice(rs.getDouble("orderTotalPrice"));
					or.setCustEmail(rs.getString("custEmail"));
					or.setRiderid(rs.getInt("riderid"));
				}
			}	catch(SQLException e) {
				e.printStackTrace();
			}
			return or;	
		}
	
		//Add Into Order 
		public int addOrder(Order or) {
			
			String custEmail = or.getCustEmail();
			double orderTotalPrice = or.getOrderTotalPrice();
			String orderDate = or.getOrderDate();
			
			int orderid = 0;
			
			Connection con = ConnectionManager.getConnection();
			
			if(or != null)
			{
				String query = "insert into orders(custEmail,orderTotalPrice,orderDate) values(?,?,?)";
				
				try(PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS))
				{
					ps.setString(1, custEmail);
					ps.setDouble(2, orderTotalPrice);
					ps.setString(3, orderDate);
					
					int numRowAffected = ps.executeUpdate();
					
					try(ResultSet rs = ps.getGeneratedKeys())
					{
						if(rs.next())
						{
							orderid = rs.getInt(1);
							System.out.println("Order id in DAO :"+ orderid);
						}
					}
					catch(SQLException e) {
						e.printStackTrace();
					}
				}
				catch(Exception ex)
				{
					System.out.println("Failed: Exception has occured!" + ex);
				}
			}
	
			return orderid;
			
		}
		
		//ASSIGN RIDER IN ORDER
		public void assignRider(Order od) {
			
			int orderid = od.getOrderid();
			int riderid = od.getRiderid();

			try {
				con = ConnectionManager.getConnection();
				String query ="UPDATE orders SET riderid= '"+ riderid +"' WHERE orderid='"+ orderid +"'";                       
				stmt = con.createStatement();
				stmt.executeUpdate(query);
				
			}	catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
		//UPDATE ORDER PROGRESS IN ORDER
				public void updateOrderProgress(Order od) {
					
					int orderid = od.getOrderid();
					String orderProgress = od.getOrderProgress();

					try {
						con = ConnectionManager.getConnection();
						String query ="UPDATE orders SET orderProgress= '"+ orderProgress +"' WHERE orderid='"+ orderid +"'";                       
						stmt = con.createStatement();
						stmt.executeUpdate(query);
						
					}	catch(Exception ex) {
						ex.printStackTrace();
					}
				}


}
