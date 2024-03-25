package com.galgoda.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.customerService.model.service.NoticeService;
import com.galgoda.customerService.model.vo.Notice;
import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.HotelUser;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeTitle = "";
		String noticeContent = "";
		
		HttpSession session = request.getSession();
		
		Notice n = new Notice();
		
		int result = 0;
		
		int writerNo = 0;
		if(session.getAttribute("loginHotel") != null) {
			noticeTitle = "[" + ((HotelUser)session.getAttribute("loginHotel")).getHotelName() + "]" + request.getParameter("title");
			noticeContent = request.getParameter("content");
			writerNo = ((HotelUser)session.getAttribute("loginHotel")).getMemNo();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			n.setMemNo(writerNo);
			result = new NoticeService().insertHotelNotice(n);
			
		}
		if(session.getAttribute("loginAdmin") != null) {
			noticeTitle = "[GALGODA]" + request.getParameter("title");
			noticeContent = request.getParameter("content");
			writerNo = ((Admin)session.getAttribute("loginAdmin")).getAdminNo();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			n.setAdminNo(writerNo);
			result = new NoticeService().insertAdminNotice(n);
		}
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항이 등록되었습니다");
			response.sendRedirect(request.getContextPath() + "/list.no?page=1");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 등록에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/list.no?page=1");
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
