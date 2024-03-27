package com.galgoda.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.common.model.service.CommonService;
import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationLoginController
 */
@WebServlet("/login.res")
public class ReservationLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		String hotelName = request.getParameter("hotelName");
		String checkInDate = request.getParameter("checkInDate");
		String checkOutDate = request.getParameter("checkOutDate");
		int roomCount = Integer.parseInt(request.getParameter("roomCount"));
		int peopleCount = Integer.parseInt(request.getParameter("peopleCount"));
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
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
                
                String hotelNameEncoded = java.net.URLEncoder.encode(hotelName, "UTF-8");
                response.sendRedirect(request.getContextPath()
                    + "/resDetail.res?searchType=hotelName&hotelName=" + hotelNameEncoded
                    + "&checkInDate=" + checkInDate + "&checkOutDate=" + checkOutDate 
                    + "&peopleCount=" + peopleCount + "&roomCount=" + roomCount
                    + "&selectHotelNo=" + hotelNo);
	        	
	        	
	        } else {
	            // 로그인 실패한 경우
	            // 로그인 실패 메시지 처리 등
	        	HttpSession session = request.getSession();
	            session.setAttribute("alertMsg", "고객 로그인에 실패했습니다.");
	            
	            String hotelNameEncoded = java.net.URLEncoder.encode(hotelName, "UTF-8");
	            response.sendRedirect(request.getContextPath()
	            		+ "/loginMain.res?hotelNo=" + hotelNo + "&hotelName=" + hotelNameEncoded + "&roomNo=" + roomNo 
       					+ "&checkIn=" + checkInDate + "&checkOut=" + checkOutDate
       					+ "&roomCount=" + roomCount + "&peopleCount=" + peopleCount);
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
