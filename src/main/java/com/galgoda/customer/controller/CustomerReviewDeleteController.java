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
 * Servlet implementation class CustomerReviewDeleteController
 */
@WebServlet("/deleteReview.cu")
public class CustomerReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNo = ((Customer)session.getAttribute("loginCustomer")).getUserNo();
		
		
		int revNo = Integer.parseInt(request.getParameter("revNo"));
	
		List<CustomerReview> updateList = new CustomerService().deleteReview(revNo, userNo);
		
		if(updateList != null) {
			request.getSession().setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");
			request.setAttribute("list", updateList);
			request.getRequestDispatcher("/views/customer/reviewList.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg","리뷰 삭제에 실패했습니다.");
			request.getRequestDispatcher("/views/customer/reviewList.jsp").forward(request, response);
			
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
