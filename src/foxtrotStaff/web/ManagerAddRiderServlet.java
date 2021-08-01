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

@WebServlet("/ManagerAddRiderServlet")
public class ManagerAddRiderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RiderDAO dao;
	
    public ManagerAddRiderServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new RiderDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Rider ri = new Rider();
		
		ri.setRiderName(request.getParameter("riderName"));
		ri.setRiderPassword(request.getParameter("riderPassword"));
		ri.setRiderPhone(request.getParameter("riderPhone"));
		
		dao.addRider(ri);
		
		request.setAttribute("ri", RiderDAO.selectAllRider());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewRiderList.jsp");
		view.forward(request, response);
	}

}
