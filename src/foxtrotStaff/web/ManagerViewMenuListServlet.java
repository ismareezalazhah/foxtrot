package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.MenuDAO;

@WebServlet("/ManagerViewMenuListServlet")
public class ManagerViewMenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManagerViewMenuListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("Mmenu", MenuDAO.ManagergetAllMenu());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewMenuList.jsp");
		view.forward(request, response);
	}

}
