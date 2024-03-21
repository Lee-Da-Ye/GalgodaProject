package com.galgoda.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.common.model.service.CommonService;

/**
 * Servlet implementation class ResetPwdFormController
 */
@WebServlet("/resetUserPwdForm.co")
public class ResetPwdFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwdFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userType = request.getParameter("userType");
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phone");
		
		// 고객인 경우
		if("customer".equals(userType)) {
			
			int result = new CommonService().confirmCustomer(userId, phone);
			
			if(result > 0) {
				// 아이디와 폰 번호 조회 시 일치하는 결과가 있을 때
				request.getRequestDispatcher("/views/common/resetPwdForm.jsp").forward(request, response);
			} else {
				session.setAttribute("alertMsg", "존재하는 회원이 없습니다.");
				response.sendRedirect(request.getContextPath() + "/findUserPwd.co");
			}
			
		}
		
		// 호텔 계정인 경우
		if("hotel".equals(userType)) {
			
			int result = new CommonService().confirmHotel(userId, phone);
			
			if(result > 0) {
				// 아이디와 폰 번호 조회 시 일치하는 결과가 있을 때
				request.getRequestDispatcher("/views/common/resetPwdForm.jsp").forward(request, response);
			} else {
				session.setAttribute("alertMsg", "존재하는 회원이 없습니다.");
				response.sendRedirect(request.getContextPath() + "/findUserPwd.co");
			}
		}
		
		
		// 관리자인 경우 
		if("admin".equals(userType)) {
			
			int result = new CommonService().confirmAdmin(userId, phone);
			
			if(result > 0) {
				// 아이디와 폰 번호 조회 시 일치하는 결과가 있을 때
				request.getRequestDispatcher("/views/common/resetPwdForm.jsp").forward(request, response);
			} else {
				session.setAttribute("alertMsg", "존재하는 회원이 없습니다.");
				response.sendRedirect(request.getContextPath() + "/findUserPwd.co");
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
