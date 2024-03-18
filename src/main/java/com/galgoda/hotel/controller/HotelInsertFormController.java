package com.galgoda.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.hotel.model.vo.Tag;

/**
 * Servlet implementation class HotelInsertFormController
 */
@WebServlet("/hotelinsertForm.ho")
public class HotelInsertFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelInsertFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 단순히 호텔등록페이지 띄워주는 용도
		
		List<Tag> list = new HotelService().hotelInsertForm();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/hotel/hotelInsertForm.jsp").forward(request, response);
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
