package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.StaffDAO;


@WebServlet("/ManagerProfileServlet")
public class ManagerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ManagerProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int staffid = Integer.parseInt(request.getParameter("staffid")); //either login or studid
		request.setAttribute("st", StaffDAO.selectStaffById(staffid));
		
		RequestDispatcher view = request.getRequestDispatcher("ManagerProfile.jsp");
		view.forward(request, response);
	}

}
