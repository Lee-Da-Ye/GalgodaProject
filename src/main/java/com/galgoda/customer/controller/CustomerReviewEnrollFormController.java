package com.galgoda.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.customer.model.vo.Reservation;

/**
 * Servlet implementation class CustomerReviewEnrollFormController
 */
@WebServlet("/enrollForm.cu")
public class CustomerReviewEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReviewEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 요청시 전달값 뽑기 (예약번호, 호텔번호)
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		String date_in = request.getParameter("date_in");
		String date_out = request.getParameter("date_out");
		int res_people = Integer.parseInt(request.getParameter("res_people"));
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		
		
		Reservation r = new CustomerService().selectReservationCase(resNo);
		/*
		Review1 r = new ReviewService().selectRev(revNo);
		
		r.setResNo(resNo);
		r.setHotelNo(hotelNo);*/
		
		/*HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		// 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
		
	    List<Review1> list = new ReviewService().selectReviewList(userNo);
		request.setAttribute("list", list); */
		//request.setAttribute("r", r);
		//request.getRequestDispatcher("/views/customer/reviewList.jsp").forward(request, response);
		// 호텔번호가지고 호텔정보 조회하기 
		/*
		List<Review1> hotelNo = new ReviewService().selectReviewList(userNo);
		List<Review1> resNo = new ReviewService().selectReviewList(userNo);
		List<Review1> r = new ReviewService().selectReviewList(userNo);*/
		request.setAttribute("hotelNo", hotelNo);
		request.setAttribute("resNo", resNo);
		request.setAttribute("r", r);
		request.setAttribute("date_in", date_in);
		request.setAttribute("date_out", date_out);
		request.setAttribute("res_people", res_people);
		request.setAttribute("revNo", revNo);
		
		request.getRequestDispatcher("/views/customer/reviewEnrollForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
