package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.RiderDAO;


@WebServlet("/ManagerViewRiderListServlet")
public class ManagerViewRiderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManagerViewRiderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("ri", RiderDAO.selectAllRider());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewRiderList.jsp");
		view.forward(request, response);
	}

}
