package com.galgoda.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customerService.model.service.ReportService;

/**
 * Servlet implementation class ReportCancelController
 */
@WebServlet("/cancel.rep")
public class ReportCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int repNo = Integer.parseInt(request.getParameter("no"));
		String repType = request.getParameter("type");
		
		int result = new ReportService().cancelReport(repNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "해당 신고가 취소처리되었습니다");
			if(repType.equalsIgnoreCase("u")) {
				response.sendRedirect(request.getContextPath() + "/userList.rep?page=1");
			}else {
				response.sendRedirect(request.getContextPath() + "/reviewList.rep?page=1");
			}
		}else {
			request.getSession().setAttribute("alertMsg", "해당 신고 취소처리에 실패했습니다");
			if(repType.equalsIgnoreCase("u")) {
				response.sendRedirect(request.getContextPath() + "/userList.rep?page=1");
			}else {
				response.sendRedirect(request.getContextPath() + "/reviewList.rep?page=1");
			}
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
