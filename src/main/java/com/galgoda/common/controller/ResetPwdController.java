package com.galgoda.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.common.model.service.CommonService;
import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class ResetPwdController
 */
@WebServlet("/resetUserPwd.co")
public class ResetPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userType = request.getParameter("userType");
		String userId = request.getParameter("userId");
		String newPassword = request.getParameter("newPassword");
		
		// 고객일 경우
		if ("customer".equals(userType)) {
            
			Customer customer = new CommonService().resetCustomerPwd(userId, newPassword);
			
			if (customer != null) {
	            // 성공적으로 비밀번호 재설정 된 경우
	        	HttpSession session = request.getSession();
	        	session.setAttribute("alertMsg", "비밀번호 재설정을 완료하였습니다.");
                session.setAttribute("loginCustomer", customer);
                response.sendRedirect(request.getContextPath());
	        	
	        	
	        } else {
	            // 로그인 실패한 경우
	            // 로그인 실패 메시지 처리 등
	        	HttpSession session = request.getSession();
	            session.setAttribute("alertMsg", "비밀번호 재설정에 실패했습니다.");
	            response.sendRedirect(request.getContextPath() + "/loginMain.co");
	        }
		
		}
		// 호텔일 경우
		if("hotel".equals(userType)) {
			
			HotelUser hoteluser = new CommonService().resetHotelUserPwd(userId, newPassword);
			
			if (hoteluser != null) {
	            // 성공적으로 비밀번호 재설정 된 경우
	        	HttpSession session = request.getSession();
	        	session.setAttribute("alertMsg", "비밀번호 재설정을 완료하였습니다.");
                session.setAttribute("loginHotel", hoteluser);
                response.sendRedirect(request.getContextPath());
	        	
	        	
	        } else {
	            // 로그인 실패한 경우
	            // 로그인 실패 메시지 처리 등
	        	HttpSession session = request.getSession();
	            session.setAttribute("alertMsg", "비밀번호 재설정에 실패했습니다.");
	            response.sendRedirect(request.getContextPath() + "/loginMain.co");
	        }
		}
		
		// 관리자일 경우
		if("admin".equals(userType)) {
			
			Admin admin = new CommonService().resetAdminPwd(userId, newPassword);
			
			if (admin != null) {
	            // 성공적으로 비밀번호 재설정 된 경우
	        	HttpSession session = request.getSession();
	        	session.setAttribute("alertMsg", "비밀번호 재설정을 완료하였습니다.");
                session.setAttribute("loginAdmin", admin);
                response.sendRedirect(request.getContextPath());
	        	
	        	
	        } else {
	            // 로그인 실패한 경우
	            // 로그인 실패 메시지 처리 등
	        	HttpSession session = request.getSession();
	            session.setAttribute("alertMsg", "비밀번호 재설정에 실패했습니다.");
	            response.sendRedirect(request.getContextPath() + "/loginMain.co");
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
