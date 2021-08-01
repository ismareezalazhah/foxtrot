package foxtrot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.connection.ConnectionManager;
import foxtrot.model.*;

public class PaymentDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	//SELECT PAYMENT BASED ON ORDERID (PAYMENT DETAILS IN CUSTOMER VIEW ORDER DETAILS)
		public static Payment getOrderPaymentById(int orderid) {
			Payment pay = new Payment();
			
			try {
				con = ConnectionManager.getConnection();
				ps = con.prepareStatement("select * from payment where orderid =?");
				
				ps.setInt(1, orderid);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					pay.setPaymentid(rs.getInt("paymentid"));
					pay.setPaymentType(rs.getString("paymentType"));
				    
				}
			}	catch (SQLException e) {
				e.printStackTrace();
			}
			return pay;
		}
		
	
	//Add new payment for online banking method
	public int addPayment(Payment pay,Onlinebanking ob) {

		String paymentType = pay.getPaymentType();
		int orderid = pay.getOrderid();
		String bankName = ob.getBankName();
		
		int paymentid = 0;
		
		String query = "insert into payment(paymentType,orderid)values(?,?)";
		
		Connection con = ConnectionManager.getConnection();
		
		if(pay!=null) {
			try(PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS))
			{
				ps.setString(1, paymentType);
				ps.setInt(2, orderid);
				
				int numRowsAffected = ps.executeUpdate();
				
				try(ResultSet rs = ps.getGeneratedKeys())
				{
					if(rs.next()) {
						paymentid = rs.getInt(1);
						System.out.println("(PaymentDAO 1) Payment id in DAO :" + paymentid);
					}
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
			catch (Exception ex) {
				System.out.println("Failed exception occured!" + ex);
			}
		}
		
		int payid = paymentid;

		try{
			ps = con.prepareStatement("insert into onlinebanking(paymentid,bankName)values(?,?)");
			
			ps.setInt(1, payid);
			ps.setString(2, bankName);
			
			ps.executeUpdate();
		}	
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return paymentid;
		
	}
	
	
	//Add new payment for credit card method
		public int addPayment2(Payment pay,Cardcredit cc) {

			String paymentType = pay.getPaymentType();
			int orderid = pay.getOrderid();
			
			String cardHolderName = cc.getCardHolderName();
			String bankName = cc.getBankName();
			String cardType = cc.getCardType();
			String cardNum = cc.getCardNum();
			String cardCvv = cc.getCardCvv();
			
			int paymentid = 0;
			
			String query = "insert into payment(paymentType,orderid)values(?,?)";
			
			Connection con = ConnectionManager.getConnection();
			
			if(pay!=null) {
				try(PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS))
				{
					ps.setString(1, paymentType);
					ps.setInt(2, orderid);
					
					int numRowsAffected = ps.executeUpdate();
					
					try(ResultSet rs = ps.getGeneratedKeys())
					{
						if(rs.next()) {
							paymentid = rs.getInt(1);
							System.out.println("(PaymentDAO 1) Payment id in DAO :" + paymentid);
						}
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
				catch (Exception ex) {
					System.out.println("Failed exception occured!" + ex);
				}
			}
			
			int payid = paymentid;

			try{
				ps = con.prepareStatement("insert into cardcredit(paymentid,cardHolderName,bankName,cardType,cardNum,cardCvv)values(?,?,?,?,?,?)");
				
				ps.setInt(1, payid);
				ps.setString(2, cardHolderName);
				ps.setString(3, bankName);
				ps.setString(4, cardType);
				ps.setString(5, cardNum);
				ps.setString(6, cardCvv);
				
				ps.executeUpdate();
			}	
			catch (Exception ex) {
				ex.printStackTrace();
			}
			
			return paymentid;
			
		}
		
	
	//Retrieve payment by id for if statement to insert into Child table
	public static Payment getPaymentById(int paymentid) {
		
		Payment pay = new Payment();
		
		try {
			Connection con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from payment where paymentid='"+ paymentid +"'");
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				pay.setPaymentid(rs.getInt("paymentid"));
				pay.setPaymentType(rs.getString("paymentType"));
				pay.setOrderid(rs.getInt("orderid"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return pay;
	}
	
}
