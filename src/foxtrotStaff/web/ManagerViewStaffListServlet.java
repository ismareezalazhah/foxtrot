package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.StaffDAO;

/**
 * Servlet implementation class ManagerViewStaffListServlet
 */
@WebServlet("/ManagerViewStaffListServlet")
public class ManagerViewStaffListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ManagerViewStaffListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("st", StaffDAO.selectAllStaff());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewStaffList.jsp");
		view.forward(request, response);
	}


}
