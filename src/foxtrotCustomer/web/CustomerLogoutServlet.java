package foxtrotCustomer.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerLogoutServlet")
public class CustomerLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CustomerLogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//get the current session
			HttpSession session = request.getSession(true);
			//set current session to null.
			session.setAttribute("CurrentSessionUser", null);
			//destroy session
			session.invalidate();
			//redirect to login page
			response.sendRedirect("index.html");
		}catch (Throwable ex) {
			System.out.println(ex);
		}
	
	}


}
