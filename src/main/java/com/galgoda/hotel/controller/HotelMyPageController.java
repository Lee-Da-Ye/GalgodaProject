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
 * Servlet implementation class HotelMyPageController
 */
@WebServlet("/mypage.ho")
public class HotelMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		HotelUser hoteluser = (HotelUser)session.getAttribute("loginHotel");
		
		// 로그인된 호텔 담당자의 userNo 가져오기
	    int hotelNo = hoteluser.getMemNo();
	    
	    int roomCount = new HotelService().countRoom(hotelNo);
	    int resCount = new HotelService().countRes(hotelNo);
	    int reviewCount = new HotelService().countReview(hotelNo);
		
		
	    if(roomCount > 0) {
	    	request.setAttribute("roomCount", roomCount);
	    } else {
	    	request.setAttribute("roomCount", 0);
	    }
	    
	    if(resCount > 0) {
	    	request.setAttribute("resCount", resCount);
	    } else {
	    	request.setAttribute("resCount", 0);
	    }
	    
	    if(reviewCount > 0) {
	    	request.setAttribute("reviewCount", reviewCount);
	    } else {
	    	request.setAttribute("reviewCount", 0);
	    }
	    
		request.getRequestDispatcher("/views/hotel/hotelMyPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
