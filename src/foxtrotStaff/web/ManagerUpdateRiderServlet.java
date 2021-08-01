package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.RiderDAO;
import foxtrot.model.*;

@WebServlet("/ManagerUpdateRiderServlet")
public class ManagerUpdateRiderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RiderDAO dao;
	
    public ManagerUpdateRiderServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new RiderDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int riderid = Integer.parseInt(request.getParameter("riderid"));
		Rider ri = RiderDAO.selectRiderById(riderid);
		request.setAttribute("ri", ri);
		RequestDispatcher view = request.getRequestDispatcher("ManagerRiderDetailsUpdate.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Rider ri = new Rider();
		
		ri.setRiderid(Integer.parseInt(request.getParameter("riderid")));
		ri.setRiderName(request.getParameter("riderName"));
		ri.setRiderPassword(request.getParameter("riderPassword"));
		ri.setRiderPhone(request.getParameter("riderPhone"));
		ri.setRiderStatus(request.getParameter("riderStatus"));
		
		
		dao.updateRiderDetails(ri);
		
		request.setAttribute("ri", RiderDAO.selectAllRider());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewRiderList.jsp");
		view.forward(request, response);
	}

}
