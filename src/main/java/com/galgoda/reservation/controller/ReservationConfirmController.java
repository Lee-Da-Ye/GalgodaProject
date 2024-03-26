package com.galgoda.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.member.model.vo.Customer;
import com.galgoda.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationConfirmController
 */
@WebServlet("/confirmReservation.res")
public class ReservationConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hotelNo = Integer.parseInt(request.getParameter("hotelNo"));
		
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("loginCustomer");
		
		int userNo = customer.getUserNo();
		String userId = customer.getUserId();
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String roomName = request.getParameter("roomName");
		String hotelName = request.getParameter("hotelName");
		String checkInDate = request.getParameter("checkInDate");
		String checkOutDate = request.getParameter("checkOutDate");
		String payMethod = request.getParameter("pay_method");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int resPeople = Integer.parseInt(request.getParameter("resPeople"));
		String resName = request.getParameter("userName");
		String resEmail = request.getParameter("email");
		String resPhone = request.getParameter("phone");
		
		int roomCount = Integer.parseInt(request.getParameter("roomCount"));
		
		String[] options = request.getParameterValues("option");
		String optionsString = String.join(", ", options);
		
		Reservation newRes = new Reservation();
		newRes.setHotelNo(hotelNo);
		newRes.setUserId(userId);
		newRes.setRoName(roomName);
		newRes.setHotelName(hotelName);
		newRes.setDateIn(checkInDate);
		newRes.setDateOut(checkOutDate);
		newRes.setPayMethod(payMethod);
		newRes.setPay(totalPrice);
		newRes.setResPeople(resPeople);
		newRes.setResName(resName);
		newRes.setResEmail(resEmail);
		newRes.setResPhone(resPhone);
		newRes.setOpName(optionsString);
		
		int result1 = new ReservationService().insertNewReservation(newRes); // 신규 예약 추가에 대한 result
		int result2 = new ReservationService().reduceRoomCount(hotelNo, roomCount); // 신규 예약 추가 시 해당 호텔, 해당 룸 count 감소시키는 결과
		
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("alertMsg", "예약 신청이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/resManagement.cu?page=1");
		} else {
			session.setAttribute("alertMsg", "예약 신청에 실패하였습니다.");
			response.sendRedirect(request.getContextPath());
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
