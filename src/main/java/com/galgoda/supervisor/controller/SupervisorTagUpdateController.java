package com.galgoda.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorUpdateTagController
 */
@WebServlet("/updateTag.su")
public class SupervisorTagUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorTagUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tagName = request.getParameter("name");
		String newTagName =request.getParameter("newTagName");
		
		int result = new SupervisorService().updateTag(tagName,newTagName);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "태그수정에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/tag.su");
		}else {
			session.setAttribute("alertMsg", "태그수정에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/tag.su");
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
