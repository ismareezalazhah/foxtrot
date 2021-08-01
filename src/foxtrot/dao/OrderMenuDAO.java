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

public class OrderMenuDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	public static int addOrderMenu(int orderid,int menuid) {
		
		try {
			Connection con = ConnectionManager.getConnection();
			ps = con.prepareStatement("insert into ordermenu(orderid,menuid) values(?,?)");
			
			ps.setInt(1, orderid);
			ps.setInt(2, menuid);
			
			ps.executeUpdate();
		}
		catch (Exception ex) {
			System.out.println("Failed : Exception occured ! "+ ex);
		}
		return menuid;
	}
	
	//xguna kot yg ni since ada dalam join
	//VIEW ORDER ITEMS BY ID
			public static List<OrderMenu> getOrderItemById(int orderid){
				
				List<OrderMenu> custorder = new ArrayList<OrderMenu>();
				
				try {
					Connection con = ConnectionManager.getConnection();
					stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select * from ordermenu where orderid= '"+ orderid +"'");
					
					while(rs.next())
					{
						OrderMenu om = new OrderMenu();
						
						om.setOrdemenuid(rs.getInt("ordermenuid"));
						om.setOrderid(rs.getInt("orderid"));
						om.setMenuid(rs.getInt("menuid"));
	
						custorder.add(om);
					}
				}	catch(SQLException e) {
					e.printStackTrace();
				}
				
				return custorder;
			}
}
