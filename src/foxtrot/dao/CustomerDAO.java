package foxtrot.dao;

import java.sql.*;

import db.connection.ConnectionManager;
import foxtrot.model.*;




public class CustomerDAO {

	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	//Validate Customer Login
	public String authorizeLogin(Customer cust) // create authorize function
	{	
		String custEmail = cust.getCustEmail();
		String custPassword = cust.getCustPassword();
		
		String dbusername = "";
		String dbpassword = "";
	
		try
		{
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("SELECT * FROM customer where custEmail = ? and custPassword = ?");
			ps.setString(1, custEmail);
			ps.setString(2, custPassword);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				dbusername = rs.getString("custEmail");   		//fetchable database record store in dbusername and dbpassword
				dbpassword = rs.getString("custPassword");
				
				if(custEmail.equals(dbusername) && custPassword.equals(dbpassword))
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
	
	
	//GET CUSTOMER BY ID (EMAIL)
	public static Customer getCustomerById(String custEmail)
	{
		Customer cust = new Customer();
	    try 
	    {
	    	con = ConnectionManager.getConnection();
	        ps=con.prepareStatement("select * from customer where custEmail=?");
	        
	        ps.setString(1, custEmail);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) 
	        {	            
	        	cust.setCustEmail(rs.getString("custEmail"));
				cust.setCustName(rs.getString("custName"));
				cust.setCustPassword(rs.getString("custPassword"));
				cust.setCustGender(rs.getString("custGender"));
				cust.setCustAddress(rs.getString("custAddress"));
				cust.setCustPhone(rs.getString("custPhone"));
	        }
	    } 
	    catch (SQLException e) 
	    {
	        e.printStackTrace();
	    }

	    return cust;
	}
	
	
	//SELECT CUSTOMER EMAIL BASED ON ORDERID (CUSTOMER DETAILS IN CUSTOMER VIEW ORDER DETAILS)
			public static Customer ViewByOrderId(int orderid) {
				Customer cs = new Customer();
				
				try {
					con = ConnectionManager.getConnection();
					ps = con.prepareStatement("select custEmail,custName,custAddress,custPhone from customer JOIN orders USING (custEmail) where orderid =?");
					
					ps.setInt(1, orderid);
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()) {
						cs.setCustEmail(rs.getString("custEmail"));
						cs.setCustName(rs.getString("custName"));
						cs.setCustAddress(rs.getString("custAddress"));
						cs.setCustPhone(rs.getString("custPhone"));
					    
					}
				}	catch (SQLException e) {
					e.printStackTrace();
				}
				return cs;
			}
			
			
			//ADD NEW CUSTOMER
			public void addCustomer(Customer cust) {
				
				String custEmail = cust.getCustEmail();
				String custName = cust.getCustName();
				String custPassword = cust.getCustPassword();
				String custGender = cust.getCustGender();
				String custAddress = cust.getCustAddress();
				String custPhone = cust.getCustPhone();

				try {
					con = ConnectionManager.getConnection();
					ps = con.prepareStatement("insert into customer (custEmail,custName,custPassword,custGender,custAddress,custPhone) values (?,?,?,?,?,?)");
					
					ps.setString(1, custEmail);
					ps.setString(2, custName);
					ps.setString(3, custPassword);
					ps.setString(4, custGender);
					ps.setString(5, custAddress);
					ps.setString(6, custPhone);

					ps.executeUpdate();
					
				}	catch(Exception ex) {
					ex.printStackTrace();
				}
				
			}				
			
	
	
	
	//UPDATE CUSTOMER DETAILS
	public void updateCustomer(Customer cust) {
		
		String custEmail = cust.getCustEmail();
		String custName = cust.getCustName();
		String custPassword = cust.getCustPassword();
		String custGender = cust.getCustGender();
		String custAddress = cust.getCustAddress();
		String custPhone = cust.getCustPhone();

		
		try {
			con = ConnectionManager.getConnection();
			String query ="UPDATE customer SET custName= '"+ custName +"', custPassword= '"+ custPassword +"', custGender= '"+ custGender +"', custAddress= '"+ custAddress +"', custPhone= '"+ custPhone +"' WHERE custEmail='"+ custEmail +"'";                       
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
}
