package foxtrotStaff.web;

import java.io.IOException;
//import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;

import foxtrot.dao.MenuDAO;
import foxtrot.model.*;


@WebServlet("/UpdateMenuServlet")
public class UpdateMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MenuDAO dao;  
 
    public UpdateMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new MenuDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int menuid = Integer.parseInt(request.getParameter("menuid"));
		Menu menu = MenuDAO.selectMenuById(menuid);
		request.setAttribute("menu", menu);
		RequestDispatcher view = request.getRequestDispatcher("ManagerUpdateMenu.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Menu m = new Menu();
		m.setMenuid(Integer.parseInt(request.getParameter("menuid")));
		m.setMenuName(request.getParameter("menuName"));
	    m.setMenuStatus(request.getParameter("menuStatus"));
	    
	    dao.updateMenu(m);

	    request.setAttribute("Mmenu", MenuDAO.ManagergetAllMenu());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewMenuList.jsp");
		
		view.forward(request, response);
		
	}

}
