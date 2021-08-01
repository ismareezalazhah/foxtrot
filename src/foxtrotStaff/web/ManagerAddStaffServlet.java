package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.StaffDAO;
import foxtrot.model.*;

@WebServlet("/ManagerAddStaffServlet")
public class ManagerAddStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO dao;
	
    public ManagerAddStaffServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new StaffDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Staff st = new Staff();
		
		st.setStaffName(request.getParameter("staffName"));
		st.setStaffPassword(request.getParameter("staffPassword"));
		st.setStaffPhone(request.getParameter("staffPhone"));
		st.setStaffCategory(request.getParameter("staffCategory"));
		
		dao.addStaff(st);
		
		request.setAttribute("st", StaffDAO.selectAllStaff());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewStaffList.jsp");
		view.forward(request, response);
	}

}
