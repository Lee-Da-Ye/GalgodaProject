package com.galgoda.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class LoginController
 */
@WebServlet("/login.co")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userType = request.getParameter("userType");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		if ("customer".equals(userType)) {
            
			Customer customer = new CommonService().loginCustomer(userId, userPwd);
		
			
			// 로그인 결과에 따른 처리
	        if (customer != null) {
	            // 성공적으로 로그인된 경우
	        	HttpSession session = request.getSession();
                session.setAttribute("loginCustomer", customer);
                response.sendRedirect(request.getContextPath());
	        	
	        	
	        } else {
	            // 로그인 실패한 경우
	            // 로그인 실패 메시지 처리 등
	        	HttpSession session = request.getSession();
	            session.setAttribute("alertMsg", "고객 로그인에 실패했습니다.");
	            response.sendRedirect(request.getContextPath() + "/views/common/loginMain.jsp");
	        }
        } else if ("hotel".equals(userType)) {
        	
        	HotelUser hotel = new CommonService().loginHotel(userId, userPwd);
        	
        	// 로그인 결과에 따른 처리
            if (hotel != null) {
                // 성공적으로 로그인된 경우
            	HttpSession session = request.getSession();
                session.setAttribute("loginHotel", hotel);
                response.sendRedirect(request.getContextPath() + "/mypage.ho"); // 호텔 마이페이지로 이동
            	
            	
            } else {
                // 로그인 실패한 경우
                // 로그인 실패 메시지 처리 등
            	HttpSession session = request.getSession();
                session.setAttribute("alertMsg", "호텔 로그인에 실패했습니다.");
                response.sendRedirect(request.getContextPath() + "/views/common/loginMain.jsp");
            }
        } else if ("admin".equals(userType)) {
            
        	Admin admin = new CommonService().loginAdmin(userId, userPwd);
        	
        	// 로그인 결과에 따른 처리
            if (admin != null) {
                // 성공적으로 로그인된 경우
            	HttpSession session = request.getSession();
                session.setAttribute("loginAdmin", admin);
                response.sendRedirect(request.getContextPath() + "/mypage.su"); // 관리자 마이페이지로 이동
            	
				
            } else {
                // 로그인 실패한 경우
                // 로그인 실패 메시지 처리 등
            	HttpSession session = request.getSession();
                session.setAttribute("alertMsg", "관리자 로그인에 실패했습니다.");
                response.sendRedirect(request.getContextPath() + "/views/common/loginMain.jsp");
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
