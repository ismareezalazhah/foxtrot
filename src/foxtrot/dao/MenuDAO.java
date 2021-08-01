package foxtrot.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import db.connection.ConnectionManager;
import foxtrot.model.*;

public class MenuDAO {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	//add menu
	public void AddMenu(Menu m)
	{
		//get values
		String menuName = m.getMenuName();
		String menuDesc = m.getMenuDesc();
		Double menuPrice = m.getMenuPrice();
		InputStream menuImage = m.getMenuImage();
		
		try 
		{
			//step 2: create connection
			con = ConnectionManager.getConnection();
			//step3 : create statement - using preparedStatement
			ps = con.prepareStatement("insert into menu (menuName,menuDesc,menuPrice,menuImage)values(?,?,?,?)");
			
			ps.setString(1,menuName);
			ps.setString(2,menuDesc);
			ps.setDouble(3,menuPrice);
			ps.setBlob(4,menuImage);
			//step 4: execute statement
			ps.executeUpdate();
			//step 5: close connection
			con.close();
		}
			
		catch (Exception ex) 
		{
			System.out.println("failed: An Exception has occurred! " + ex);
		}
	}
	
	//list All Menu (Manager)
		public static List<Menu> ManagergetAllMenu() 
		{
			List<Menu> Mmenu = new ArrayList<Menu>();
			try 
			{
				Connection con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from menu order by menuid");
				while (rs.next()) 
				{
					Menu mm = new Menu();
					
					mm.setMenuid(rs.getInt("menuid"));
					mm.setMenuName(rs.getString("menuName"));
					mm.setMenuDesc(rs.getString("menuDesc"));
					mm.setMenuPrice(rs.getDouble("menuPrice"));
					
					//Image Method
					Blob image = rs.getBlob("menuImage");
					InputStream inputStream = image.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					
					try {
						while((bytesRead = inputStream.read(buffer)) != -1) {
							outputStream.write(buffer, 0, bytesRead);
						}
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					byte[] imageBytes = outputStream.toByteArray();
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					
					mm.setBase64Image(base64Image);
					mm.setMenuStatus(rs.getString("menuStatus"));
					
					Mmenu.add(mm);
				}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return Mmenu;
		}
	
	
	
	//list All Menu
	public static List<Menu> getAllMenu() 
	{
		List<Menu> menu = new ArrayList<Menu>();
		try 
		{
			Connection con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from menu WHERE menuStatus = 'Available' order by menuid");
			while (rs.next()) 
			{
				Menu m = new Menu();
				
				m.setMenuid(rs.getInt("menuid"));
				m.setMenuName(rs.getString("menuName"));
				m.setMenuDesc(rs.getString("menuDesc"));
				m.setMenuPrice(rs.getDouble("menuPrice"));
				
				//Image Method
				Blob image = rs.getBlob("menuImage");
				InputStream inputStream = image.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				
				try {
					while((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);
				
				m.setBase64Image(base64Image);
				
				
				menu.add(m);
			}
		} 
		
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return menu;
	}
	
	//list All Unavailable Menu                  // DELETE NI KALAU XJADI
		public static List<Menu> getAllUnavailableMenu() 
		{
			List<Menu> menu2 = new ArrayList<Menu>();
			try 
			{
				Connection con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from menu WHERE menuStatus = 'Unavailable' order by menuid;");
				while (rs.next()) 
				{
					Menu m2 = new Menu();
					
					m2.setMenuid(rs.getInt("menuid"));
					m2.setMenuName(rs.getString("menuName"));
					m2.setMenuDesc(rs.getString("menuDesc"));
					m2.setMenuPrice(rs.getDouble("menuPrice"));
					
					//Image Method
					Blob image = rs.getBlob("menuImage");
					InputStream inputStream = image.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					
					try {
						while((bytesRead = inputStream.read(buffer)) != -1) {
							outputStream.write(buffer, 0, bytesRead);
						}
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					byte[] imageBytes = outputStream.toByteArray();
					String base64Image = Base64.getEncoder().encodeToString(imageBytes);
					
					m2.setBase64Image(base64Image);
					
					
					menu2.add(m2);
				}
			} 
			
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return menu2;
		}
	
	
	//SELECT MENU BASED ON ID
	public static Menu selectMenuById(int menuid) {
		Menu menu = new Menu();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from menu where menuid =?");
			
			ps.setInt(1, menuid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				menu.setMenuid(rs.getInt("menuid"));
			    menu.setMenuName(rs.getString("menuName"));
			    menu.setMenuDesc(rs.getString("menuDesc"));
			    menu.setMenuPrice(rs.getDouble("menuPrice"));
			    
			    //Image Method
				Blob image = rs.getBlob("menuImage");
				InputStream inputStream = image.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				
				try {
					while((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);
				
				menu.setBase64Image(base64Image);
				menu.setMenuStatus(rs.getString("menuStatus"));

			}
		}	catch (SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}
	
	//Menu Update
	public void updateMenu(Menu m) {
		
		int menuid = m.getMenuid();
		String menuName = m.getMenuName();
		String menuStatus = m.getMenuStatus();

		try {
			con = ConnectionManager.getConnection();
	//		String query ="UPDATE menu SET menuName= '"+ menuName +"', menuDesc= '"+ menuDesc +"', menuPrice= '" + menuPrice +"', menuImage= '"+ menuImage +"' WHERE menuid='"+ menuid +"'";
			String query ="UPDATE menu SET menuName= '"+ menuName +"', menuStatus= '"+ menuStatus +"' WHERE menuid='"+ menuid +"'"; 
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	//DELETE MENU
	public void deleteMenu(int menuid) {
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("delete from menu where menuid =?");
			
			ps.setInt(1, menuid);
			ps.executeUpdate();
			
		}	catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
