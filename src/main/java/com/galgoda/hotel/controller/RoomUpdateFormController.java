package com.galgoda.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.hotel.model.vo.Option;
import com.galgoda.hotel.model.vo.Room;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class RoomUpdateFormController
 */
@WebServlet("/roomUpdateForm.ho")
public class RoomUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String hotelName = ((HotelUser)(request.getSession().getAttribute("loginHotel"))).getHotelName();
		
			List<Option> list = new HotelService().roomInsertForm();
			List<Room> rlist = new HotelService().selectRoomList(hotelName);
			
			request.setAttribute("list", list);
			request.setAttribute("rlist", rlist);
			
			request.getRequestDispatcher("/views/hotel/roomUpdateForm.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
