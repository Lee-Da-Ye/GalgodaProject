package com.galgoda.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customerService.model.service.InqService;

/**
 * Servlet implementation class inqUpdateController
 */
@WebServlet("/update.inq")
public class inqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int inqNo = Integer.parseInt(request.getParameter("no"));
		String inqAnswer = request.getParameter("answer");
		
		int result = new InqService().updateInq(inqNo, inqAnswer);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의사항 답변이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.inq?page=1");
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
