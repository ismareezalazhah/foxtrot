package foxtrotStaff.web;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig; //if error delete this
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import foxtrot.dao.MenuDAO;
import foxtrot.model.*;


@WebServlet("/ManagerAddMenuServlet")
@MultipartConfig(maxFileSize = 16177215) //if error delete this
public class ManagerAddMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuDAO dao;
	
    public ManagerAddMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new MenuDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Menu m = new Menu();
		
		m.setMenuName(request.getParameter("menuName"));
		m.setMenuDesc(request.getParameter("menuDesc"));
		m.setMenuPrice(Double.parseDouble(request.getParameter("menuPrice")));
		
		//Image Method
		InputStream inputStream = null;
		Part menuImage = request.getPart("menuImage");
		if(menuImage != null) {
			inputStream = menuImage.getInputStream();
			m.setMenuImage(inputStream);
		}
		
		dao.AddMenu(m);
		
		
		request.setAttribute("Mmenu", MenuDAO.ManagergetAllMenu());
		RequestDispatcher view = request.getRequestDispatcher("ManagerViewMenuList.jsp");
		view.forward(request, response);
		
		
		
	
	}

}
