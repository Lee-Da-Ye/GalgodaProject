package com.galgoda.customer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class CustomerResCancelController
 */
@WebServlet("/resCancel.cu")
public class CustomerResCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerResCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int resNo = Integer.parseInt(request.getParameter("id"));
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
		
		int result = new CustomerService().cancelReservation(resNo);
		List<Reservation> reservations = new CustomerService().selectReservation(userNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "예약이 성공적으로 취소되었습니다.");
			session.setAttribute("reservations", reservations); // 동일한 키값으로 다시 담게 되면 덮어씌워짐
			response.sendRedirect(request.getContextPath() + "/resManagement.cu?page=1");
		}else {
			session.setAttribute("alertMsg", "예약취소에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/resManagement.cu?page=1");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
