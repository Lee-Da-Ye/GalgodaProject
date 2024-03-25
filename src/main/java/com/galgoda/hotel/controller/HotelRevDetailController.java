package com.galgoda.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.customer.model.vo.Review;
import com.galgoda.hotel.model.service.HotelService;

/**
 * Servlet implementation class HotelRevDetailController
 */
@WebServlet("/revDetail.ho")
public class HotelRevDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelRevDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int revNo = Integer.parseInt(request.getParameter("no"));
		String type = "RV";
		
		Review r = new HotelService().selectReview(revNo);
		List<Attachment> alist = new HotelService().selectFileList(revNo, type);
		
	
		
		request.setAttribute("r", r);
		request.setAttribute("alist", alist);
		request.getRequestDispatcher("/views/hotel/hotelRevDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
