package com.galgoda.reservation.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.reservation.model.service.ReservationService;
import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class ReservationDetailFormController
 */
@WebServlet("/reservationDetail.res")
public class ReservationDetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		//호텔정보 받아오기 
		Hotel h = new SupervisorService().detailHotel(hotelNo);
		
		//체크인, 체크아웃 날짜 받아오고 N박 수 계산하기
		String checkInDate = request.getParameter("checkInDate");
		String checkOutDate = request.getParameter("checkOutDate");
		
		// 몇 박인지 계산 
		
		//roomNo로 roomName 받아오기
		String roomName = new ReservationService().findRoomName(roomNo);
		
		//예약 정보 받아오기
		String hotelName = request.getParameter("hotelName");
		String hotelCheckin = request.getParameter("checkIn");
		String hotelCheckout = request.getParameter("checkOut");
		
		
		//호텔정보 전달하기
		request.setAttribute("hotelCheckin", hotelCheckin);
		request.setAttribute("hotelCheckout", hotelCheckout);
		request.setAttribute("hotel", h);
		request.setAttribute("roomName", roomName);
		
		
		request.getRequestDispatcher("/views/reservation/ReservationHotelDetailForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
