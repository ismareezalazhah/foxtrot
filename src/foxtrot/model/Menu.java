package foxtrot.model;

import java.io.InputStream;

//import java.sql.Blob;

public class Menu {
	
	int menuid;
	String menuName;
	String menuDesc;
	Double menuPrice;
	
	InputStream menuImage;
	private String base64Image;
	String menuStatus; //tukar sini kalau xjadi
	
	
	public int getMenuid() {
		return menuid;
	}
	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuDesc() {
		return menuDesc;
	}
	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}
	public Double getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(Double menuPrice) {
		this.menuPrice = menuPrice;
	}
	public InputStream getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(InputStream menuImage) {
		this.menuImage = menuImage;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public String getMenuStatus() { //tukar sini kalau xjadi
		return menuStatus;
	}
	public void setMenuStatus(String menuStatus) {
		this.menuStatus = menuStatus;
	}
 
	

}
