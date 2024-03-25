package com.galgoda.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.service.HotelService;

/**
 * Servlet implementation class RoomDeleteController
 */
@WebServlet("/roomDelete.ho")
public class RoomDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int roomNo = Integer.parseInt(request.getParameter("roNo"));
		String type = "R";
		
		int result = new HotelService().deleteRoom(roomNo);
		int result2 = new HotelService().deleteAttachment(roomNo, type);
	
		if( result + result2 > 0) {
			// 성공 => 
			request.getSession().setAttribute("alertMsg", "객실이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/roomUpdateForm.ho");
			
			
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
