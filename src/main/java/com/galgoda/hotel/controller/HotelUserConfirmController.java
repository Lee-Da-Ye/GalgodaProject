package com.galgoda.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class HotelUserConfirmController
 */
@WebServlet("/confirmHotelUser.ho")
public class HotelUserConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelUserConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//호텔 담당자 정보
		HttpSession session = request.getSession();
		HotelUser hotelUser = (HotelUser)session.getAttribute("loginHotel");
	    
		
	    // 로그인된 호텔계정의 userId 가져오기
	    String userId = hotelUser.getMemId();
	    
	    String userPwd = request.getParameter("userPwd");
	    
	    HotelUser hu = new HotelService().selectHotelUser(userId);
	    
	    if(hu != null && hu.getMemPwd().equals(userPwd)) { // 사용자가 입력한 비밀번호가 일치
	    	request.setAttribute("hu", hu);
	    	request.getRequestDispatcher("/views/hotel/hotelPersonalInfoUpdateForm.jsp").forward(request, response);
	    } else {
	    	session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
	    	response.sendRedirect(request.getContextPath() + "/personalInfo.ho");
            
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
