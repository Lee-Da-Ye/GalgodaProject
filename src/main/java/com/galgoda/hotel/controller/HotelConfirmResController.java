package com.galgoda.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.service.HotelService;

/**
 * Servlet implementation class HotelConfirmResController
 */
@WebServlet("/confirmRes.ho")
public class HotelConfirmResController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelConfirmResController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int resNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new HotelService().confirmReservation(resNo);
	
		if(result > 0) {
			// 성공 => 
			request.getSession().setAttribute("alertMsg", "예약승인 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/resList.ho?page=1");
		
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
