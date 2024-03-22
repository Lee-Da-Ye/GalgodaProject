package com.galgoda.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Option;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class RoomInsertFormController
 */
@WebServlet("/roominsertForm.ho")
public class RoomInsertFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomInsertFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hotelName = ((HotelUser)(request.getSession().getAttribute("loginHotel"))).getHotelName();
		
		Hotel h = new HotelService().selectHotelNo(hotelName);
		
		List<Option> list = new HotelService().roomInsertForm();
		
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("h", h);
		
		
		request.getRequestDispatcher("/views/hotel/roomInsertForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
