package com.galgoda.supervisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.PageInfo;
import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorCodeListController
 */
@WebServlet("/codeList.su")
public class SupervisorCodeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorCodeListController() {
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
		
		listCount = new SupervisorService().selectHotelListCount();
		currentPage = Integer.parseInt(request.getParameter("page")); 
		pageLimit = 5;
		boardLimit= 10;
		
		maxPage = (int)(Math.ceil((double)listCount/boardLimit));
		startPage = (currentPage-1)/pageLimit*pageLimit +1;

		endPage = startPage + pageLimit -1;
		if(endPage >maxPage) {
			endPage =maxPage;
		}
		
		PageInfo pi =new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		List<HotelUser> list = new SupervisorService().selectCodeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/supervisor/supervisorHotelCodeList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
