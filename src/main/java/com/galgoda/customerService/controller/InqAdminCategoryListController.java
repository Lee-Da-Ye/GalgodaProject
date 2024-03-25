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

/**
 * Servlet implementation class InqAdminListController
 */
@WebServlet("/adminList.inq")
public class InqAdminCategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqAdminCategoryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String category = request.getParameter("category");
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage; 
		int startPage; 
		int endPage; 
		
		if(category.equals("전체")) {
			listCount = new InqService().selectInqListCount();
		}else {
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
		if(category.equals("전체")) {
			list1 = new InqService().selectInqList(pi);
		}else {
			list1 = new InqService().selectInqHotelList(pi, category);
		}
		
		List<Hotel> list2 = new InqService().selectHotelName();
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/customerService/inqAdminCategoryList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
