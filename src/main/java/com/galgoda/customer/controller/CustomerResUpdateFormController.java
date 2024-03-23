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
 * Servlet implementation class CustomerResUpdateFormController
 */
@WebServlet("/resUpdateForm.cu")
public class CustomerResUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerResUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 선택한 개별 예약번호
		int resNo = Integer.parseInt(request.getParameter("id"));
		
		// 세션에서 로그인된 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
		List<Reservation> reservations = new CustomerService().selectReservation(userNo);
		
		
		// 선택한 개별 예약 번호에 대해서만 예약정보를 조회
		Reservation selectedReservation = null;
	    for (Reservation r : reservations) {
	        if (r.getResNo() == resNo) {
	            selectedReservation = r;
	            break;
	        }
	    }

		
	    request.setAttribute("reservations", reservations);
	    request.setAttribute("selectedReservation", selectedReservation); //
		
		request.getRequestDispatcher("/views/customer/resUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
