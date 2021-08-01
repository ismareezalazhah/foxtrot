package foxtrotRider.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.OrderDAO;

@WebServlet("/RiderOrderServlet")
public class RiderOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RiderOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int riderid = Integer.parseInt(request.getParameter("riderid"));
		
		request.setAttribute("riderorder", OrderDAO.getRiderOrder(riderid));

		RequestDispatcher view = request.getRequestDispatcher("RiderViewCurrentOrder.jsp");
		view.forward(request, response);
	}

}
