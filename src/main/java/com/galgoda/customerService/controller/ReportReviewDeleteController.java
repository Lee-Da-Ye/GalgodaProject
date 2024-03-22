package com.galgoda.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customerService.model.service.ReportService;

/**
 * Servlet implementation class ReportReviewDeleteController
 */
@WebServlet("/reviewDelete.rep")
public class ReportReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int revNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new ReportService().deleteReportReview(revNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "신고된 리뷰가 삭제되었습니다");
			response.sendRedirect(request.getContextPath() + "/reviewList.rep?page=1");
		} else {
			request.getSession().setAttribute("alertMsg", "신고된 리뷰 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/reviewList.rep?page=1");
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
