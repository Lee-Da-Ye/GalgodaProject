package com.galgoda.reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customer.model.vo.Wishlist;
import com.galgoda.reservation.model.service.ReservationService;
import com.google.gson.Gson;

/**
 * Servlet implementation class WishListController
 */
@WebServlet("/wishlist.res")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
       
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        int wishHotelNo = Integer.parseInt(request.getParameter("hotelId"));
	
        int result = new ReservationService().wishlList(userNo, wishHotelNo);
     
	
        
        if(result > 0) {
			// 성공 => 
        	response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            
            // 성공 메시지를 JSON 형식으로 응답
            out.print("{\"success\": true}");
            out.flush();
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
