package com.galgoda.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		
		//roomNo로 roomName 받아오기
		String roomName = new ReservationService().findRoomName(roomNo);
		//roomNo로 roomPrice 받아오기
		int roomPrice = new ReservationService().findRoomPrice(roomNo);
		
		//예약 정보 받아오기
		int roomCount = Integer.parseInt(request.getParameter("roomCount"));
		String hotelName = request.getParameter("hotelName");
		String hotelCheckin = request.getParameter("checkIn");
		String hotelCheckout = request.getParameter("checkOut");
		
		// 몇 박인지 계산 
		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일");

		String formattedCheckin = null;
		String formattedCheckout = null;
		long numberOfNights = 0; // 박수를 저장할 변수

		try {
		    Date checkinDate = inputFormat.parse(hotelCheckin);
		    Date checkoutDate = inputFormat.parse(hotelCheckout);

		    // 날짜 차이 계산
		    long differenceInMilliseconds = checkoutDate.getTime() - checkinDate.getTime();
		    
		    // 차이를 밀리초에서 일로 변환
		    numberOfNights = differenceInMilliseconds / (1000 * 60 * 60 * 24);

		    formattedCheckin = outputFormat.format(checkinDate);
		    formattedCheckout = outputFormat.format(checkoutDate);

		} catch (ParseException e) {
		    e.printStackTrace();
		}

		//예약정보 객체
		Reservation r = new Reservation();
		r.setDateIn(formattedCheckin);
		r.setDateOut(formattedCheckout);
		r.setRoName(roomName);
		r.setRoomCount(roomCount);
		r.setRoNo(roomNo);
		r.setRoPrice(roomPrice);
		
		
		//호텔정보 전달하기
		request.setAttribute("r", r);
		request.setAttribute("numberOfNights", numberOfNights);
		request.setAttribute("hotel", h);
		
		
		
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
