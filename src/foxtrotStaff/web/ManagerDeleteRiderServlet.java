package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.RiderDAO;


@WebServlet("/ManagerDeleteRiderServlet")
public class ManagerDeleteRiderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private RiderDAO dao;   
   
    public ManagerDeleteRiderServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new RiderDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int riderid = Integer.parseInt(request.getParameter("riderid"));
		dao.deleteRider(riderid);

		request.setAttribute("ri", RiderDAO.selectAllRider());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewRiderList.jsp"); // Able to delete but error to redirect
		view.forward(request, response);
	}

}
