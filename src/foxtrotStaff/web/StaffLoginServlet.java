package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foxtrot.model.*;
import foxtrot.dao.StaffDAO;


@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public StaffLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("btn_login")!=null)
		{
			int staffid = Integer.parseInt(request.getParameter("staffid"));
			String staffPassword = request.getParameter("staffPassword");
			String staffCategory = request.getParameter("staffCategory");
			
			String staffrole = "staff";
			String managerrole = "manager";
			
			Staff s = new Staff();
			
			s.setStaffid(staffid);
			s.setStaffPassword(staffPassword);
			s.setStaffCategory(staffCategory);
			
			StaffDAO StaffDAO = new StaffDAO();
			
			String authorize = StaffDAO.authorizeLogin(s);
			
			if(authorize.equals("SUCCESS LOGIN"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("CurrentSessionUser", s.getStaffid()); // session name is "login" and store email in "getStudEmail()" get through LoginBean object
				session.setAttribute("SessionCategory", s.getStaffCategory());
				
				if(staffCategory.equals(staffrole))
				{
					RequestDispatcher rd = request.getRequestDispatcher("StaffPage.jsp"); //redirect to view page
			        rd.forward(request, response);
				}
				
				else if(staffCategory.equals(managerrole))
				{
					RequestDispatcher rd = request.getRequestDispatcher("ManagerPage.jsp"); //redirect to view page
			        rd.forward(request, response);
				}

			}
			else
			{
				request.setAttribute("WrongLoginMsg", authorize); // wrong login error message
				RequestDispatcher rd = request.getRequestDispatcher("StaffLogin.jsp"); // show error in the page
				rd.include(request, response);
			}
		}
		
	}

}
