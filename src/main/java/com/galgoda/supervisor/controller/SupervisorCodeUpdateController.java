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
 * Servlet implementation class SupervisorModifyCode
 */
@WebServlet("/updateCode.su")
public class SupervisorCodeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorCodeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo	= Integer.parseInt(request.getParameter("memNo"));
		String hotelName = request.getParameter("hotelName");
		String hotelCode = request.getParameter("hotelCode");
		String memName = request.getParameter("memName");
		
		HotelUser code = new HotelUser();
		
		code.setAuthentiCode(hotelCode);
		code.setHotelName(hotelName);
		code.setMemName(memName);
		code.setMemNo(memNo);
		
		
		int result = new SupervisorService().updateCode(code);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "인증코드 성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detailCode.su?no=" + memNo);
		}else {
			session.setAttribute("alertMsg", "인증코드 수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detailCode.su?no=" + memNo);
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
