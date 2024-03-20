package com.galgoda.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.supervisor.model.service.SupervisorService;
import com.galgoda.supervisor.model.vo.Terms;

/**
 * Servlet implementation class SupervisorDetailTerms
 */
@WebServlet("/detailTerms.su")
public class SupervisorDetailTermsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorDetailTermsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int termNo = Integer.parseInt(request.getParameter("no"));
		
		SupervisorService ss = new SupervisorService();
		
		Terms t = ss.detailTerms(termNo);
		Attachment at = ss.selectFile(termNo); 
		
		request.setAttribute("term", t);
		request.setAttribute("at", at);
		request.getRequestDispatcher("/views/supervisor/supervisorTermDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
