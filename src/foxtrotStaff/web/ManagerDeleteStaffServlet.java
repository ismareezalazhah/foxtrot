package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.StaffDAO;


@WebServlet("/ManagerDeleteStaffServlet")
public class ManagerDeleteStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO dao;
	
    public ManagerDeleteStaffServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new StaffDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int staffid = Integer.parseInt(request.getParameter("staffid"));
		dao.deleteStaff(staffid);

		request.setAttribute("st", StaffDAO.selectAllStaff());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewStaffList.jsp"); // Able to delete but error to redirect
		view.forward(request, response);
	}

}
