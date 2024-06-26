package com.galgoda.customerService.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.customerService.model.service.ReportService;
import com.galgoda.hotel.model.vo.Report;

/**
 * Servlet implementation class ReportReviewDetailController
 */
@WebServlet("/reviewDetail.rep")
public class ReportReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int repNo = Integer.parseInt(request.getParameter("no"));
		int refNo = Integer.parseInt(request.getParameter("refNo"));
		System.out.println(repNo);
		Report r = new ReportService().selectReportReview(repNo);
		List<Attachment> list = new ReportService().selectReportReviewAttachment(refNo);
		System.out.println(r);
		System.out.println(list);
		
		request.setAttribute("r", r);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/customerService/reportReviewDetail.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
