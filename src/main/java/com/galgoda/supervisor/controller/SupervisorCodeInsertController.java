package com.galgoda.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.member.model.vo.HotelUser;
import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorCodeInsertController
 */
@WebServlet("/insertCode.su")
public class SupervisorCodeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorCodeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		String hotelCode = request.getParameter("hotelCode");
		HotelUser code = new HotelUser();
		code.setAuthentiCode(hotelCode);
		code.setHotelName(hotelName);
		
		int result = new SupervisorService().insertCode(code);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "인증코드 등록에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/codeList.su?page=1");
		}else {
			session.setAttribute("alertMsg", "인증코드 등록에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/codeList.su?page=1");
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
