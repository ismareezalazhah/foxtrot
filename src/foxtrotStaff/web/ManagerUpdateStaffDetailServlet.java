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

@WebServlet("/ManagerUpdateStaffDetailServlet")
public class ManagerUpdateStaffDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StaffDAO dao;   

    public ManagerUpdateStaffDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new StaffDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int staffid = Integer.parseInt(request.getParameter("staffid"));
		Staff st = StaffDAO.selectStaffById(staffid);
		request.setAttribute("st", st);
		RequestDispatcher view = request.getRequestDispatcher("ManagerStaffDetailsUpdate.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Staff st = new Staff();
		
		st.setStaffid(Integer.parseInt(request.getParameter("staffid")));
		st.setStaffName(request.getParameter("staffName"));
		st.setStaffPassword(request.getParameter("staffPassword"));
		st.setStaffPhone(request.getParameter("staffPhone"));
		st.setStaffCategory(request.getParameter("staffCategory"));
		
		
		dao.updateStaffDetails(st);
		
		request.setAttribute("st", StaffDAO.selectAllStaff());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewStaffList.jsp");
		view.forward(request, response);
	}

}
