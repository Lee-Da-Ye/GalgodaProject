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
 * Servlet implementation class supervisorHotelList
 */
@WebServlet("/hotelList.su")
public class supervisorHotelListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supervisorHotelListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; // 현재 게시글의 총 갯수
		int currentPage; //현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이징바의 페이지 최대갯수(몇개단위씩 표현할건지)
		int boardLimit; // 한 페이지에 보여질 게시글 최대갯수 (몇개 단위씩)
		// 위의 4개를 가지고 페이징바의 시작수, 끝수, 가장마지막페이지(총페이지수)
		int maxPage; //가장 마지막 페이지(총 페이지수)
		int startPage; // 사용자가 요처한 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // " 끝수 
		
		// * listCount : 총 게시글 갯수 (db로부터 조회)
		listCount = new SupervisorService().selectHotelListCount();
		// * currentPage : 사용자가 요청한 페이지수(현재띄워줄페이지)
		currentPage = Integer.parseInt(request.getParameter("page")); 
		// 목록페이지 부르는 이거 실행때 애초에 ?page=현재페이지로 부르기 
		pageLimit = 5; //1~5
		// * boardLimit : 게시글 최대 갯수 (게시글 노출 단위) 
		boardLimit= 10;
		
		maxPage = (int)(Math.ceil((double)listCount/boardLimit));
		startPage = (currentPage-1)/pageLimit*pageLimit +1;

		endPage = startPage + pageLimit -1;
		if(endPage >maxPage) {
			endPage =maxPage;
		}
		
		PageInfo pi =new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		List<HotelUser> list = new SupervisorService().selectHotelList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/supervisor/supervisorHotelList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
