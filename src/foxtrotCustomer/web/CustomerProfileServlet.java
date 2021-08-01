package foxtrotCustomer.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import foxtrot.dao.*;



@WebServlet("/CustomerProfileServlet")
public class CustomerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomerProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String custEmail = request.getParameter("custEmail");
		request.setAttribute("cust", CustomerDAO.getCustomerById(custEmail));
		
		RequestDispatcher view = request.getRequestDispatcher("CustomerProfile.jsp");
        view.forward(request, response);
	}


}
