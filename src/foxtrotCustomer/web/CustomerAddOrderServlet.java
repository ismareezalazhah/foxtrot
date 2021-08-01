package foxtrotCustomer.web;

import java.io.IOException;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import foxtrot.model.*;
import foxtrot.dao.JoinDAO;
import foxtrot.dao.OrderDAO;
import foxtrot.dao.OrderMenuDAO;

@WebServlet("/CustomerAddOrderServlet")
public class CustomerAddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO dao;
	
    public CustomerAddOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new OrderDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Order or = new Order();
		
		HttpSession session = request.getSession(true); 
		
		@SuppressWarnings("unchecked")
		List<OrderMenu> omA = (List<OrderMenu>) session.getAttribute("cart");
		
		or.setCustEmail(request.getParameter("custEmail")); 
		
		//InsertTotalPrice
		double totalPrice = Double.parseDouble(request.getParameter("orderTotalPrice"));
		or.setOrderTotalPrice(totalPrice);
		
		System.out.println("Total Price in Order :" + totalPrice); //debugging purpose
		
		//InsertDate
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		String orderDate = formatter.format(date);
		
		or.setOrderDate(orderDate);
		
		
		//InsertOrderID
		int orderid = dao.addOrder(or);
		
		or.setOrderid(orderid);
		request.setAttribute("or", OrderDAO.getOrderById(or.getOrderid()));
		or = OrderDAO.getOrderById(or.getOrderid());
		session.setAttribute("CurrentSessionOrderID", or.getOrderid());
		
		OrderDAO.getOrderId(orderid);
		
		//Inside OrderMenu
		for (int i=0; i<omA.size(); i++)
		{
			OrderMenu o = omA.get(i);
			int menuid = o.getMenuid();
			OrderMenuDAO.addOrderMenu(orderid,menuid);
			
			System.out.println("Menuid in OrderMenu : "+ menuid); //debugging purpose
			
		}
		
		//debugging purpose
		System.out.println("order id: "+ orderid);
		
		//request.setAttribute("orinfo", JoinDAO.getJoinInfo(orderid));
		
		System.out.println("Hye");
		RequestDispatcher view = request.getRequestDispatcher("CustomerPayment.jsp");
		view.forward(request, response);
		
		
	}

	
	
	
	
}
