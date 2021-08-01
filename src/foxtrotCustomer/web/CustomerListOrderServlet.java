package foxtrotCustomer.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foxtrot.dao.OrderDAO;
import foxtrot.model.*;

@WebServlet("/CustomerListOrderServlet")
public class CustomerListOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CustomerListOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Order or = new Order();
		
		HttpSession session = request.getSession(true);
		String custEmail = (String) session.getAttribute("CurrentSessionUser");
		or.setCustEmail(custEmail);
		System.out.println("Cust Email in customer list order servlet : "+ custEmail);
		
		request.setAttribute("orderCust", OrderDAO.getAllOrderCustomer(custEmail));
		RequestDispatcher view = request.getRequestDispatcher("CustomerListOrder.jsp");
		view.forward(request, response);
		
	}



}
