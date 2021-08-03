package foxtrotCustomer.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foxtrot.model.Customer;
import foxtrot.dao.*;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public CustomerLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("btn_login")!=null) // check login button not null
		{
			
			String custEmail = request.getParameter("custEmail");
			String custPassword = request.getParameter("custPassword");
		
			Customer cust = new Customer();
			
			cust.setCustEmail(custEmail);
			cust.setCustPassword(custPassword);
			
			
			CustomerDAO CustomerDAO= new CustomerDAO();
			
			String authorize = CustomerDAO.authorizeLogin(cust);
			
			if(authorize.equals("SUCCESS LOGIN"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("CurrentSessionUser", cust.getCustEmail()); // session name is "login" and store email in "getStudEmail()" get through LoginBean object
		        RequestDispatcher rd = request.getRequestDispatcher("CustomerPage.jsp"); //redirect to view page
		        rd.forward(request, response);
			}
			else
			{
				request.setAttribute("WrongLoginMsg", authorize); // wrong login error message
				RequestDispatcher rd = request.getRequestDispatcher("CustomerLogin.jsp"); // show error in the page
				rd.include(request, response);
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
