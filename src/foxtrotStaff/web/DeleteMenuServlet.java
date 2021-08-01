package foxtrotStaff.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foxtrot.dao.MenuDAO;


@WebServlet("/DeleteMenuServlet")
public class DeleteMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MenuDAO dao;  

    public DeleteMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new MenuDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int menuid = Integer.parseInt(request.getParameter("menuid"));
		dao.deleteMenu(menuid);

		request.setAttribute("menu", MenuDAO.getAllMenu());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewMenuList.jsp"); // Able to delete but error to redirect
		view.forward(request, response);
	}

}
