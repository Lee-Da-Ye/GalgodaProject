package com.galgoda.hotel.controller;

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
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class HotelUpdateFormController
 */
@WebServlet("/hotelupdateForm.ho")
public class HotelUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginHotel")!= null) {
		int memNo = ((HotelUser)(request.getSession().getAttribute("loginHotel"))).getMemNo();
		String htype = "H";
		
		Hotel h =  new HotelService().selectHotelForm(memNo);
		List<Attachment> alist = new HotelService().selectFileList(h.getHotelNo(), htype);
		request.setAttribute("h", h);
		request.setAttribute("alist", alist);
		}
		
		List<Tag> list = new HotelService().hotelInsertForm();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/hotel/hotelUpdateForm.jsp").forward(request, response);
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
