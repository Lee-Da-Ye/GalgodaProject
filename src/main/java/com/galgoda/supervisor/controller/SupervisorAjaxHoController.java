package com.galgoda.supervisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.hotel.model.vo.Hotel;
import com.galgoda.supervisor.model.service.SupervisorService;
import com.google.gson.Gson;

/**
 * Servlet implementation class SupervisorAjaxHoController
 */
@WebServlet("/searchHo.su")
public class SupervisorAjaxHoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorAjaxHoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int type = Integer.parseInt(request.getParameter("type"));
		String value = request.getParameter("value");
		
		List<Hotel>	list = new SupervisorService().searchHotelList(type,value);
		
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
