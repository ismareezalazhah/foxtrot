package foxtrotRider.web;

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

@WebServlet("/RiderViewOrderDetailServlet")
public class RiderViewOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RiderViewOrderDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		
		request.setAttribute("custorder", JoinDAO.getOrderItemById(orderid));
		request.setAttribute("ri", RiderDAO.selectRiderByOrderId(orderid));
		request.setAttribute("cs", CustomerDAO.ViewByOrderId(orderid));
		request.setAttribute("od", OrderDAO.getOrderById(orderid));
		request.setAttribute("pay", PaymentDAO.getOrderPaymentById(orderid));
		request.setAttribute("pc", JoinDAO.getChildOrderPaymentById(orderid));
		
		RequestDispatcher view = request.getRequestDispatcher("RiderViewOrderDetail.jsp");
        view.forward(request, response);
	}

}
