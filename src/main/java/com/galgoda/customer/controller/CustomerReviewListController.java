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
 * Servlet implementation class CustomerReviewlist
 */
@WebServlet("/reviewlist.cu")
public class CustomerReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//전달할 데이터 - 예약정보 조회해오기
	      // 세션에서 로그인된 사용자 정보 가져오기
	       HttpSession session = request.getSession();
	       Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	       
	       
	       // 로그인된 사용자의 userNo 가져오기
	       int userNo = loginCustomer.getUserNo();
		
		// 요청처리 (응답데이터 조회 서비스 호출(저 페이지에서 필요한 데이터 조회))
		List<CustomerReview> list = new CustomerService().selectReviewList(userNo);
		// 응답페이지 : /views/customer/reviewList.jsp 리뷰관리페이지
		// 응답데이터 : 모든 리뷰목록(작성여부, 호텔이름, 숙박기간, 숙박인원, 대표이미지)
		request.setAttribute("list", list); 
		request.getRequestDispatcher("/views/customer/reviewList.jsp").forward(request, response); // 이 경로 못찾으면 404오류 뜸
		// 이게 servlet쪽 코드다?
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
