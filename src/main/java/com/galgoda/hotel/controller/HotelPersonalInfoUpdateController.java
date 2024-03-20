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
 * Servlet implementation class HotelPersonalInfoUpdateController
 */
@WebServlet("/hotelPersonalInfoUpdate.ho")
public class HotelPersonalInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelPersonalInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String updatedPwd = request.getParameter("updatedPwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		HotelUser hu = new HotelUser();
		hu.setMemId(userId);
		hu.setMemName(userName);
		hu.setMemPwd(updatedPwd);
		hu.setMemPhone(phone);
		hu.setMemEmail(email);
		
		HotelUser updatehu = new HotelService().updatePersonalInfo(hu);
		
		if(updatehu == null) { // 실패일 경우
			
			// 에러문구
			request.setAttribute("alertMsg", "담당자 정보 수정에 실패했습니다");
			request.getRequestDispatcher("/views/hotel/hotelPersonalInfoForm.jsp").forward(request, response);
			
			
		}else { // 성공일 경우
			
			// 마이페이지 / 알람문구("성공적으로 회원정보 변경되었습니다.")
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 담당자 정보를 변경하였습니다.");
			session.setAttribute("loginHotel", updatehu); // 동일한 키값으로 다시 담게 되면 덮어씌워짐
			
			// 마이페이지로 포워딩
			response.sendRedirect(request.getContextPath() + "/mypage.ho");
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
