package com.galgoda.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.common.model.service.CommonService;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class SignUpHotelConfirmController
 */
@WebServlet("/signupHotelConfirm.co")
public class SignUpHotelConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpHotelConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("userId");
		String memPwd = request.getParameter("userPwd");
		String memName = request.getParameter("userName");
		String memPhone = request.getParameter("phone");
		String memEmail = request.getParameter("email");
		String hotelName = request.getParameter("hotelName");
		String authentiCode = request.getParameter("verificationCode");
		
		HotelUser hu = new HotelUser();
		
		hu.setMemId(memId);
		hu.setMemPwd(memPwd);
		hu.setMemName(memName);
		hu.setMemPhone(memPhone);
		hu.setMemEmail(memEmail);
		hu.setHotelName(hotelName);
		hu.setAuthentiCode(authentiCode);
		
		int result = new CommonService().updateHotelUser(hu);
		
		if(result > 0) {
			HttpSession session = request.getSession(); // session 객체 얻어오기
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다. 반갑습니다!");
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("alertMsg", "회원가입에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/signupHotel.co");
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
