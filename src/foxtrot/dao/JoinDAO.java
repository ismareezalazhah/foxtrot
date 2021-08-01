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

public class JoinDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	//VIEW ORDER ITEMS BY ID
	public static List<Join> getOrderItemById(int orderid){
		
		List<Join> custorder = new ArrayList<Join>();
		
		try {
			Connection con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from ordermenu JOIN menu USING (menuid) JOIN orders USING (orderid) where orderid ='"+ orderid +"'");
			
			while(rs.next())
			{
				Join odl = new Join();
				
				odl.setMenuid(rs.getInt("menuid"));
				odl.setMenuName(rs.getString("menuName"));
				odl.setMenuPrice(rs.getDouble("menuPrice"));

				custorder.add(odl);
			}
		}	catch(SQLException e) {
			e.printStackTrace();
		}
		
		return custorder;
	}
	
	
	//SELECT PAYMENT BASED ON ORDERID (PAYMENT DETAILS IN CUSTOMER VIEW ORDER DETAILS)
	public static Join getChildOrderPaymentById(int orderid) {
			String type1 = "OnlineBanking";
			String type2 = "Card";
			Join pc = new Join();
		
			Join temp = new Join();
			
			con = ConnectionManager.getConnection();
			
		try {
			ps  = con.prepareStatement("select * from orders JOIN payment USING (orderid) WHERE orderid=?");
			ps.setInt(1, orderid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				temp.setPaymentid(rs.getInt("paymentid"));
				temp.setPaymentType(rs.getString("paymentType"));
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
			//getChildData
			int paymentid = temp.getPaymentid();
			String paymentType = temp.getPaymentType();

			if(paymentType.equals(type1))
			{
				try {
					con = ConnectionManager.getConnection();
					ps = con.prepareStatement("select * from onlinebanking where paymentid =?");
					
					ps.setInt(1, paymentid);
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()) {
						pc.setPaymentid(rs.getInt("paymentid"));
						pc.setBankName(rs.getString("bankName"));
					    
					}
				}	catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			else if(paymentType.equals(type2))
			{
				try {
					con = ConnectionManager.getConnection();
					ps = con.prepareStatement("select * from cardcredit where paymentid =?");
					
					ps.setInt(1, paymentid);
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()) {
						pc.setPaymentid(rs.getInt("paymentid"));
						pc.setCardHolderName(rs.getString("cardHolderName"));
						pc.setBankName(rs.getString("bankName"));
						pc.setCardType(rs.getString("cardType"));
						pc.setCardNum(rs.getString("cardNum"));
						pc.setCardCvv(rs.getString("cardCvv"));  
					}
				}	catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return pc;
			}
	
	
	
	//SELECT PAYMENT BASED ON ORDERID (PAYMENT DETAILS IN CUSTOMER VIEW ORDER DETAILS)
	public static Join getPaymentTypeById(int paymentid,String paymentType) {
		Join pc = new Join();
		
		String type1 = "OnlineBanking";
		String type2 = "Card";
		
		if(paymentType.equals(type1))
		{
			try {
				con = ConnectionManager.getConnection();
				ps = con.prepareStatement("select * from onlinebanking where paymentid =?");
				
				ps.setInt(1, paymentid);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					pc.setPaymentid(rs.getInt("paymentid"));
					pc.setBankName(rs.getString("bankName"));
				    
				}
			}	catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		else if(paymentType.equals(type2))
		{
			try {
				con = ConnectionManager.getConnection();
				ps = con.prepareStatement("select * from cardcredit where paymentid =?");
				
				ps.setInt(1, paymentid);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					pc.setPaymentid(rs.getInt("paymentid"));
					pc.setCardHolderName(rs.getString("cardHolderName"));
					pc.setBankName(rs.getString("bankName"));
					pc.setCardType(rs.getString("cardType"));
					pc.setCardNum(rs.getString("cardNum"));
					pc.setCardCvv(rs.getString("cardCvv"));  
				}
			}	catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return pc;
		
		
	}	
	
	
	
	
	
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	
	public static Join getJoinInfo(int orderid) {
		System.out.println("order ID :"+ orderid); //debug purpose
		
		Join jo = new Join();
		
		try {
			Connection con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select orders.orderid, orders.orderDate, customer.custEmail, customer.custPhone, "
					+ "customer.custAddress, orders.orderProgress FROM orders INNER JOIN customer ON "
					+ "orders.custEmail=customer.custEmail where orders.orderid='"+orderid +"'");
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				jo.setOrderid(rs.getInt("orderid"));
				jo.setOrderDate(rs.getString("orderDate"));
				jo.setCustEmail(rs.getString("custEmail"));
				jo.setCustPhone(rs.getString("custPhone"));
				jo.setCustAddress(rs.getString("custAddress"));
				jo.setOrderProgress(rs.getString("orderProgress"));
			}
	
		}	catch(SQLException e) {
			e.printStackTrace();
		}
		return jo;
	}
	

}
