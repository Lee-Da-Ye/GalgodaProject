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
 * Servlet implementation class SupervisorOptionDeleteController
 */
@WebServlet("/deleteOption.su")
public class SupervisorOptionDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorOptionDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("deleteOption");
		
		int result = new SupervisorService().deleteOption(name);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", name + " 옵션 삭제에 삭제하였습니다.");
			response.sendRedirect(request.getContextPath() + "/option.su");
		}else {
			session.setAttribute("alertMsg", name + " 옵션 삭제에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/option.su");
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
