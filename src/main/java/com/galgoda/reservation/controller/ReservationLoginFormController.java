package com.galgoda.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationLoginController
 */
@WebServlet("/loginMain.res")
public class ReservationLoginFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationLoginFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		String hotelName = request.getParameter("hotelName"); // 검색할 때 입력한 호텔 이름
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String checkInDate = request.getParameter("checkIn");
		String checkOutDate = request.getParameter("checkOut");
		int roomCount = Integer.parseInt(request.getParameter("roomCount"));
		int peopleCount = Integer.parseInt(request.getParameter("peopleCount"));
		
		Reservation loginRes = new Reservation();
		loginRes.setHotelNo(hotelNo);
		loginRes.setHotelName(hotelName);
		loginRes.setRoNo(roomNo);
		loginRes.setDateIn(checkInDate);
		loginRes.setDateOut(checkOutDate);
		loginRes.setRoomCount(roomCount);
		loginRes.setResPeople(peopleCount);
		
		request.setAttribute("loginRes", loginRes);
		
		request.getRequestDispatcher("/views/reservation/ReservationLoginMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
