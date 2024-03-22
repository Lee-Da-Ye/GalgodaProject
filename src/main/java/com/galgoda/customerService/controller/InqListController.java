package com.galgoda.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.customerService.model.service.InqService;
import com.galgoda.customerService.model.vo.Inq;
import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class InqListController
 */
@WebServlet("/list.inq")
public class InqListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage; 
		int startPage; 
		int endPage; 
		String hotelName;
		String category;
		
		if(request.getSession().getAttribute("loginHotel") != null) {
			hotelName = ((HotelUser)request.getSession().getAttribute("loginHotel")).getHotelName();
			listCount = new InqService().selectInqHotelListCount(hotelName);
		}else if(request.getSession().getAttribute("loginCustomer") != null) {
			listCount = new InqService().selectInqListCount();
		}else {
			category = request.getParameter("cateogry");
			listCount = new InqService().selectInqHotelListCount(category);
		}
		currentPage = Integer.parseInt(request.getParameter("page"));
		pageLimit = 5;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		List<Inq> list1 = new ArrayList<>();
		if(request.getSession().getAttribute("loginHotel") != null) {
			hotelName = ((HotelUser)request.getSession().getAttribute("loginHotel")).getHotelName();
			list1 = new InqService().selectInqHotelList(pi, hotelName);
		}else if(request.getSession().getAttribute("loginCustomer") != null) {
			list1 = new InqService().selectInqUserList(pi);
		}else {
			category = request.getParameter("cateogry");
			list1 = new InqService().selectInqHotelList(pi, category);
		}
		List<Hotel> list2 = new InqService().selectHotelName();
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("/views/customerService/inqList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
