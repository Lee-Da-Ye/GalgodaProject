package com.galgoda.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorHotelDeleteController
 */
@WebServlet("/deleteHotel.su")
public class SupervisorHotelDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorHotelDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hotelNo = Integer.parseInt(request.getParameter("no").trim());
		
		int result = new SupervisorService().deleteHotel(hotelNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "호텔 정보 삭제에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/hotelList.su?page=1");
		}else {
			request.getSession().setAttribute("alertMsg", "호텔 정보 삭제에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/hotelList.su?page=1");
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
