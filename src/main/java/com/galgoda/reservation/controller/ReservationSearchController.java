package com.galgoda.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customer.model.vo.Reservation;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationSearchController
 */
@WebServlet("/search.res")
public class ReservationSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		String[] hotelTags = request.getParameterValues("tagCheckbox");
		String hotelTag = null;
		if(hotelTags != null) {
			hotelTag = String.join(", ", hotelTags);
		}
		String hotelCheckin = request.getParameter("checkInDate");
		String hotelCheckout = request.getParameter("checkOutDate");
		int peopleCount =Integer.parseInt(request.getParameter("peopleCount"));
		int roomCount = Integer.parseInt(request.getParameter("roomCount"));
		
		String searchType = request.getParameter("searchType");
		
	
		Reservation r = new Reservation();
		r.setHotelName(hotelName);
		r.setTagNo(hotelTag);
		r.setDateIn(hotelCheckin);
		r.setDateOut(hotelCheckout);
		r.setResPeople(peopleCount);
		r.setRoomCount(roomCount);
		r.setSearchType(searchType);
		
		List<Hotel> list = new ReservationService().searchHotelList(r, searchType);
		
		
		request.setAttribute("list", list);
		request.setAttribute("r", r);
		
		request.getRequestDispatcher("/views/reservation/ReservationSearchForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
