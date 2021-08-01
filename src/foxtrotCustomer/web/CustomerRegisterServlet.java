package foxtrotCustomer.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.CustomerDAO;
import foxtrot.model.*;

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
    public CustomerRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new CustomerDAO();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Customer cust = new Customer();
		cust.setCustEmail(request.getParameter("custEmail"));
		cust.setCustName(request.getParameter("custName"));
		cust.setCustPassword(request.getParameter("custPassword"));
		cust.setCustGender(request.getParameter("custGender"));
		cust.setCustAddress(request.getParameter("custAddress"));
		cust.setCustPhone(request.getParameter("custPhone"));
		
		dao.addCustomer(cust);

		RequestDispatcher view = request.getRequestDispatcher("CustomerSuccessNotification.jsp");
		view.forward(request, response);
	}

}
