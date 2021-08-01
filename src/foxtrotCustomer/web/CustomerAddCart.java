package foxtrotCustomer.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foxtrot.dao.MenuDAO;

import foxtrot.model.*;


@WebServlet("/CustomerAddCart")
public class CustomerAddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CustomerAddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int menuid = Integer.parseInt(request.getParameter("menuid"));
		
		Menu menu = MenuDAO.selectMenuById(menuid);
		System.out.println(menuid); // debugging purpose
		
		OrderMenu om = new OrderMenu();
		
		om.setMenuid(menu.getMenuid());
		om.setMenuName(menu.getMenuName());
		om.setMenuPrice(menu.getMenuPrice());
		om.setTotalPrice(om.getTotalPrice());
		
		int quantity = 1;
		om.setQuantity(quantity);
		
		HttpSession session = request.getSession(true); 
		
		@SuppressWarnings("unchecked")
		List<OrderMenu> omA = (List<OrderMenu>) session.getAttribute("cart");
		
		if(omA == null)
		{
			List<OrderMenu> omAA = new ArrayList<OrderMenu>();
			omAA.add(om);
			
			session.setAttribute("cart", omAA);
			request.setAttribute("orderMenu", omAA); 
			
			response.sendRedirect("CustomerCart.jsp");
		}
		else {
			omA.add(om);
			session.setAttribute("cart", omA);
			response.sendRedirect("CustomerCart.jsp");
		}
	}		
	
	
}
