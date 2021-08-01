package foxtrot.model;

//import java.sql.Time;
//import java.util.Date;

public class Order {

	int orderid;
	String orderProgress;
	String orderDate;
//	Time orderTime;
	double orderTotalPrice;
	String custEmail;
	int riderid;
	
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getOrderProgress() {
		return orderProgress;
	}
	public void setOrderProgress(String orderProgress) {
		this.orderProgress = orderProgress;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
//	public Time getOrderTime() {
//		return orderTime;
//	}
//	public void setOrderTime(Time orderTime) {
//		this.orderTime = orderTime;
//	}
	public double getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(double orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}
	public String getCustEmail() {
		return custEmail;
	}
	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}
	public int getRiderid() {
		return riderid;
	}
	public void setRiderid(int riderid) {
		this.riderid = riderid;
	}
	
	
	

	
}
