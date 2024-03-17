package com.galgoda.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.member.model.vo.Admin;
import com.galgoda.member.model.vo.Hotel;
import com.galgoda.notice.model.service.NoticeService;
import com.galgoda.notice.model.vo.Notice;

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
			noticeTitle = "[" + ((Hotel)session.getAttribute("loginHotel")).getMemName() + "]" + request.getParameter("title");
			noticeContent = request.getParameter("content");
			writerNo = ((Hotel)session.getAttribute("loginHotel")).getMemNo();
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
			response.sendRedirect(request.getContextPath() + "/list.no");
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
