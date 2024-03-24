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
 * Servlet implementation class FindIdConfirmController
 */
@WebServlet("/findUserIdConfirm.co")
public class FindIdConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
HttpSession session = request.getSession();
		
		String userType = request.getParameter("userType");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		// 고객인 경우
		if("customer".equals(userType)) {
			
			String userId = new CommonService().findUserId(userName, phone);
			
			if(userId == null) {
				// 해당하는 userID 없음
				session.setAttribute("alertMsg", "회원정보에 고객님의 정보가 없습니다.");
				response.sendRedirect(request.getContextPath() + "/loginMain.co");
			} else {
				// 해당하는 userId 있음
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("/views/common/findUserIdResult.jsp").forward(request, response);
			}
			
			
		}
		
		if("hotel".equals(userType)) {
			
			String userId = new CommonService().findHotelUserId(userName, phone);
			
			if(userId == null) {
				// 해당하는 userID 없음
				session.setAttribute("alertMsg", "회원정보에 담당자님의 정보가 없습니다.");
				response.sendRedirect(request.getContextPath() + "/loginMain.co");
			} else {
				// 해당하는 userId 있음
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("/views/common/findUserIdResult.jsp").forward(request, response);
			}
			
			
		}
		
		if("admin".equals(userType)) {
			
			String userId = new CommonService().findAdminUserId(userName, phone);
			
			if(userId == null) {
				// 해당하는 userID 없음
				session.setAttribute("alertMsg", "회원정보에 관리자님의 정보가 없습니다.");
				response.sendRedirect(request.getContextPath() + "/loginMain.co");
			} else {
				// 해당하는 userId 있음
				request.setAttribute("userId", userId);
				request.getRequestDispatcher("/views/common/findUserIdResult.jsp").forward(request, response);
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
