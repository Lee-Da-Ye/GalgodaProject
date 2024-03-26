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
import com.galgoda.customer.model.vo.CustomerReview;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class CustomerReviewInsertController
 */
@WebServlet("/insert.cu")
public class CustomerReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		//int res_people = Integer.parseInt(request.getParameter("res_people"));
		String revTitle = request.getParameter("revTitle");
		String revContent = request.getParameter("revContent");
		int revRating = Integer.parseInt(request.getParameter("revRating"));
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		
		
		HttpSession session = request.getSession();
		int userNo = ((Customer)session.getAttribute("loginCustomer")).getUserNo();
		
		CustomerReview r = new CustomerReview();
		r.setRevNo(revNo);
		r.setResNo(resNo);
		
		r.setRevTitle(revTitle);
		r.setRevContent(revContent);
		r.setRevRating(revRating);
		r.setUserNo(userNo); 
		r.setHotelNo(hotelNo);
		
	
		List<CustomerReview> updateList = new CustomerService().insertReview(r);
		// 처리된 행수 돌아올거라 받아줄 변수 미리 씀 ReviewService클래스에 insertReview 만들 예정 
	
		if(updateList != null) {
			// 성공시 => 목록페이지 + alert "성공"
			session.setAttribute("alertMsg", "리뷰가 성공적으로 등록되었습니다.");
			request.setAttribute("list", updateList);
			request.getRequestDispatcher("/views/customer/reviewList.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/reviewlist.cu"); // url 재요청 ==> Servlet을 실행
		}else {
			request.setAttribute("alertMsg", "리뷰 등록에 실패했습니다.");
			//response.sendRedirect(request.getContextPath()+"/reviewlist.cu");
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
