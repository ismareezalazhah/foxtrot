package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.CustomerDAO;
import foxtrot.dao.JoinDAO;
import foxtrot.dao.OrderDAO;
import foxtrot.dao.PaymentDAO;
import foxtrot.dao.RiderDAO;
import foxtrot.model.Order;


@WebServlet("/ManagerAssignRiderServlet")
public class ManagerAssignRiderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO dao;
    public ManagerAssignRiderServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new OrderDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Order od = new Order();

		od.setOrderid(Integer.parseInt(request.getParameter("orderid")));
		od.setRiderid(Integer.parseInt(request.getParameter("riderid")));
		
		dao.assignRider(od);
		
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		
		request.setAttribute("custorder", JoinDAO.getOrderItemById(orderid));
		request.setAttribute("ri", RiderDAO.selectRiderByOrderId(orderid));
		request.setAttribute("cs", CustomerDAO.ViewByOrderId(orderid));
		request.setAttribute("od", OrderDAO.getOrderById(orderid));
		request.setAttribute("pay", PaymentDAO.getOrderPaymentById(orderid));
		request.setAttribute("pc", JoinDAO.getChildOrderPaymentById(orderid));
		request.setAttribute("rider", RiderDAO.selectAllAvailableRider());
		
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewOrderDetail.jsp");
        view.forward(request, response);
	}

}
