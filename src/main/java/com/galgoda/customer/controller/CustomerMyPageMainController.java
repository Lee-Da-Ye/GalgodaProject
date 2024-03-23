package com.galgoda.customer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.member.model.vo.Customer;

/**
 * Servlet implementation class CustomerMyPageMainController
 */
@WebServlet("/mypage.cu")
public class CustomerMyPageMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerMyPageMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    
	    // 로그인된 사용자의 userNo 가져오기
	    int userNo = loginCustomer.getUserNo();
		
	    int resCount = new CustomerService().countRes(userNo);
	    int wishCount = new CustomerService().countWish(userNo);
	    int reviewCount = new CustomerService().countReview(userNo);
	    
	    if(resCount > 0) {
	    	request.setAttribute("resCount", resCount);
	    } else {
	    	request.setAttribute("resCount", 0);
	    }
	    
	    if(resCount > 0) {
	    	request.setAttribute("wishCount", wishCount);
	    } else {
	    	request.setAttribute("wishCount", 0);
	    }
	    
	    if(resCount > 0) {
	    	request.setAttribute("reviewCount", reviewCount);
	    } else {
	    	request.setAttribute("reviewCount", 0);
	    }
	    
		
		request.getRequestDispatcher("/views/customer/mypageMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
