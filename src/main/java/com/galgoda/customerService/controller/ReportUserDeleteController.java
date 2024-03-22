package com.galgoda.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customerService.model.service.ReportService;

/**
 * Servlet implementation class ReportUserDeleteController
 */
@WebServlet("/userDelete.rep")
public class ReportUserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUserDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		
		int result = new ReportService().deleteReportUser(userId);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "신고된 사용자의 계정이 삭제되었습니다");
			response.sendRedirect(request.getContextPath() + "/userList.rep?page=1");
		}else {
			request.getSession().setAttribute("alertMsg", "신고된 사용자의 계정 삭제에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/userList.rep?page=1");
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
