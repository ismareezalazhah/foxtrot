package foxtrotCustomer.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import foxtrot.dao.PaymentDAO;
import foxtrot.model.*;

@WebServlet("/CustomerPaymentServlet")
public class CustomerPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PaymentDAO dao;   

    public CustomerPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = new PaymentDAO();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Payment pay = new Payment();
		
		HttpSession session = request.getSession(true);
		int orderid = (Integer)session.getAttribute("CurrentSessionOrderID");
		
		System.out.println("(CustPayServlet 1) Order id in payment : " + orderid); //debugging
		
		//IF CONDITION FOR PAYMENT TYPE
		String type1 = "OnlineBanking";
		String type2 = "Card";
		
		String paymentType = request.getParameter("paymentType");
		
		if(paymentType.equals(type1)) {
			
			pay.setOrderid(orderid);
			pay.setPaymentType(request.getParameter("paymentType"));
			
			Onlinebanking ob = new Onlinebanking();
			
			ob.setBankName(request.getParameter("bankName"));
			
			int paymentid = dao.addPayment(pay,ob);
			System.out.println("(CustPayServlet 2) Payment id :" + paymentid); //debugging
			
			request.setAttribute("payments", PaymentDAO.getPaymentById(paymentid));
			
		}
		else if(paymentType.equals(type2)) {
			
			pay.setOrderid(orderid);
			pay.setPaymentType(request.getParameter("paymentType"));
			
			Cardcredit cc = new Cardcredit();
			
			cc.setCardHolderName(request.getParameter("cardHolderName"));
			cc.setBankName(request.getParameter("bankName"));
			cc.setCardType(request.getParameter("cardType"));
			cc.setCardNum(request.getParameter("cardNum"));
			cc.setCardCvv(request.getParameter("cardCvv"));
			
			int paymentid = dao.addPayment2(pay,cc);
			System.out.println("(CustPayServlet 2) Payment id :" + paymentid); //debugging
			
			request.setAttribute("payments", PaymentDAO.getPaymentById(paymentid));
		}

		System.out.println("(CustPayServlet 3) Done!"); //debugging
		response.sendRedirect("CustomerListOrderServlet");
	}

	
	
	
	
	
	
	
	
	
	
	
}
