package foxtrotRider.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foxtrot.dao.RiderDAO;
import foxtrot.model.*;


@WebServlet("/RiderLoginServlet")
public class RiderLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public RiderLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("btn_login")!=null) // check login button not null
		{
			int riderid = Integer.parseInt(request.getParameter("riderid"));
			String riderPassword = request.getParameter("riderPassword");
		
			Rider ri = new Rider();

			ri.setRiderid(riderid);
			ri.setRiderPassword(riderPassword);
			
			
			RiderDAO RiderDAO= new RiderDAO();
			
			String authorize = RiderDAO.authorizeLogin(ri);
			
			if(authorize.equals("SUCCESS LOGIN"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("CurrentSessionUser", ri.getRiderid()); // session name is "login" and store email in "getStudEmail()" get through LoginBean object
		        RequestDispatcher rd = request.getRequestDispatcher("RiderPage.jsp"); //redirect to view page
		        rd.forward(request, response);
			}
			else
			{
				request.setAttribute("WrongLoginMsg", authorize); // wrong login error message
				RequestDispatcher rd = request.getRequestDispatcher("RiderLogin.jsp"); // show error in the page
				rd.include(request, response);
			}
		}
	}

}
