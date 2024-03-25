package com.galgoda.customerService.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.common.model.vo.Attachment;
import com.galgoda.customerService.model.service.InqService;
import com.galgoda.customerService.model.vo.Inq;

/**
 * Servlet implementation class InqDetailController
 */
@WebServlet("/detail.inq")
public class InqDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int inqNo = Integer.parseInt(request.getParameter("no")); 
		
		Inq inq = new InqService().selectInq(inqNo);
		List<Attachment> list = new InqService().selectInqAttachment(inqNo);
		request.setAttribute("inq", inq);
		request.setAttribute("list", list);
		
		if(request.getSession().getAttribute("loginAdmin") != null) {
			request.getRequestDispatcher("/views/customerService/inqAdminDetail.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/views/customerService/inqDetail.jsp").forward(request, response);
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
