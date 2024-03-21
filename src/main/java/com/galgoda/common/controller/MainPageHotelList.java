package com.galgoda.common.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.service.CommonService;
import com.galgoda.hotel.model.vo.Hotel;

/**
 * Servlet implementation class MainPageHotelList
 */
@WebServlet("/mainPageHotelList.co")
public class MainPageHotelList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageHotelList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Hotel> popularHotelList = new CommonService().selectPopularHotelList();
	    
	    // 리스트 객체를 JSON 형식의 문자열로 변환
	    StringBuilder json = new StringBuilder();
	    json.append("[");
	    for (int i = 0; i < popularHotelList.size(); i++) {
	        Hotel hotel = popularHotelList.get(i);
	        json.append("{");
	        json.append("\"hotelName\": \"" + hotel.getHotelName() + "\",");
	        json.append("\"hotelNo\": " + hotel.getHotelNo() + ",");
	        json.append("\"reservationCount\": " + hotel.getResCount() + ",");
	        json.append("\"imgPath\": \"" + hotel.getImgPath() + "\"");
	        json.append("}");
	        if (i < popularHotelList.size() - 1) {
	            json.append(",");
	        }
	    }
	    json.append("]");
	    
	    // JSON 형식의 문자열을 응답으로 전송
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
