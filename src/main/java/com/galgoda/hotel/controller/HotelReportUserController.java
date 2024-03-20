package com.galgoda.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.service.HotelService;
import com.galgoda.hotel.model.vo.Report;

/**
 * Servlet implementation class HotelReportUserController
 */
@WebServlet("/reportUser.ho")
public class HotelReportUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelReportUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int resNo = Integer.parseInt(request.getParameter("resNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		String repReason = "";
		if(		request.getParameter("reportReason")!= null) {
			repReason = request.getParameter("reportReason");
		}
		String repContent = "";
		if(		request.getParameter("repContent") != null) {
			repContent = request.getParameter("repContent");
		}
		
		Report r = new Report();
		r.setResNo(resNo);
		r.setRepRefNo(userNo);
		r.setRepReason(repReason);
		r.setRepContent(repContent);
		
		int result = new HotelService().reportUser(r);
		
		if(result > 0) {
			// 성공 => 
			request.getSession().setAttribute("alertMsg", "신고 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/resList.ho?page=1");
			
			
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
