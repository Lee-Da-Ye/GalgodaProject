package com.galgoda.supervisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.hotel.model.vo.Tag;
import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorHotelDetailController
 */
@WebServlet("/hotelDetail.su")
public class SupervisorHotelDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorHotelDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no").trim();
		
		int hotelNo = Integer.parseInt(no);
		String htype = "H";
		
		Hotel h =  new SupervisorService().selectHotelForm(hotelNo);
		List<Tag> list = new HotelService().hotelInsertForm();
		List<Attachment> alist = new HotelService().selectFileList(h.getHotelNo(), htype);
		
		request.setAttribute("h", h);
		request.setAttribute("list", list);
		request.setAttribute("alist", alist);
		
		request.getRequestDispatcher("/views/supervisor/supervisorHotelDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
