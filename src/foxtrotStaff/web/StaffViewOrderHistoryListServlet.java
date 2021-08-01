package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.OrderDAO;


@WebServlet("/StaffViewOrderHistoryListServlet")
public class StaffViewOrderHistoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public StaffViewOrderHistoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("orderhistory", OrderDAO.getAllOrderHistory());
		RequestDispatcher view = request.getRequestDispatcher("StaffViewOrderHistory.jsp");
		view.forward(request, response);
	}


}
