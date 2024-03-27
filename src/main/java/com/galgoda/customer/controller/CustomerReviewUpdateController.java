package com.galgoda.customer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customer.model.service.CustomerService;
import com.galgoda.customer.model.vo.CustomerReview;


/**
 * Servlet implementation class CustomerReviewUpdateController
 */
@WebServlet("/reviewUpdate.cu")
public class CustomerReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		String revTitle = request.getParameter("revTitle");
		String revContent = request.getParameter("revContent");
		int revRating = Integer.parseInt(request.getParameter("revRating"));
		
		CustomerReview r = new CustomerService().selectRev(revNo);
		System.out.println(r);
		r.setRevNo(revNo);
		r.setRevTitle(revTitle);
		r.setRevContent(revContent);
		r.setRevRating(revRating);
		
		int result = new CustomerService().updateReview(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg","리뷰가 수정되었습니다.");
			//request.getRequestDispatcher("/views/customer/reviewList.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/reviewlist.cu");
		
		}else {
			request.getSession().setAttribute("alertMsg","리뷰 수정 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/reviewlist.cu");
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
